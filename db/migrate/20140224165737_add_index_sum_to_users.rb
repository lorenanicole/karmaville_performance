class AddIndexSumToUsers < ActiveRecord::Migration
  def change
    add_index :users, :sum
  end
end
