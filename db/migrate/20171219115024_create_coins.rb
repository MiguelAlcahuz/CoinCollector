class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.integer :year
      t.integer :country
      t.float :value

      t.timestamps
    end
  end
end
