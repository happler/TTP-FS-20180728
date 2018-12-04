class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :ticker, null: false
      t.integer :quantity, null: false, default: 0
      t.integer :buyer_id, null: false 

      t.timestamps
    end
    add_index :stocks, :buyer_id
  end
end
