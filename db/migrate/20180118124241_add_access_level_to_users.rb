class AddAccessLevelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :roles, :integer, default: 0
  end
end
