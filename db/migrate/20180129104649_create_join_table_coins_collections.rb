class CreateJoinTableCoinsCollections < ActiveRecord::Migration[5.1]
  def change
    create_join_table :coins, :collections do |t|
      t.index [:coin_id, :collection_id], name: 'coins_collections_index'
      t.index [:collection_id, :coin_id], name: 'collections_coins_index'
    end
  end
end