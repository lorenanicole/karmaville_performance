class AddSumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sum, :integer
  end
end
