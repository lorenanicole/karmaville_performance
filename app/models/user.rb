# require 'pry'

class User < ActiveRecord::Base

  USERS_PER_PAGE = 1000

  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :sum

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
    order('sum DESC')
  end

  def total_karma
    self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_sum
    # self.update_attributes(sum: total_karma)
    self.sum = total_karma
    self.save
  end

  def self.page(num)
        # binding.pry
    num = num.to_i
    if num == "" || num == nil
      num = 0
    else
      num -= 1
    end
    User.by_karma.limit(USERS_PER_PAGE).offset(num * USERS_PER_PAGE)
  end
end
