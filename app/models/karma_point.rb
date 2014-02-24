class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  after_save :revise_sum

  def revise_sum
    self.user.update_attributes(sum: self.user.total_karma)
    # self.user.update_sum
  end

end
