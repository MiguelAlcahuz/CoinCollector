class AddUserIdToCollections < ActiveRecord::Migration[5.1]
  def change
    add_reference :collections, :user, foreign_key: true
  end
end
