class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :ticker, null: false
      t.float :price, null: false
      t.integer :quantity, null: false
      t.integer :buyer_id, null: false

      t.timestamps
    end
    add_index :transactions, :buyer_id
  end
end
