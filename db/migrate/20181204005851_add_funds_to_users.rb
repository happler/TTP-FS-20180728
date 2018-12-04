class AddFundsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :funds, :integer, default: 5000, null: false
  end
end
