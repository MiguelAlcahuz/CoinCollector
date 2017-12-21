class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :currency
      t.integer :totalcoin
      t.float :sumtotalcoin
      t.references :coin, foreign_key: true

      t.timestamps
    end
  end
end
