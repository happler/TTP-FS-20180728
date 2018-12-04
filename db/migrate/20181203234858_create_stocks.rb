class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.integer :quantity
      t.integer :buyer_id

      t.timestamps
    end
    add_index :stocks, :buyer_id
  end
end
