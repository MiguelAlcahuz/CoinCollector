class CoinCollections < ActiveRecord::Migration[5.1]
  def change
  	create_table :coincollections, :id => false do |t|
  		t.integer :coin_id
  		t.integer :collection_id
  	end
  end
end
