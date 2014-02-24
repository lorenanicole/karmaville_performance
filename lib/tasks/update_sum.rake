namespace :user do
  desc "Update user karma point sum"
  task :update_sum => [:environment] do
    #this will call on reminder class method
    User.all.each do |u|
      u.update_column(:sum, u.total_karma)
      u.save(:validate => false)
    end
  end
end
