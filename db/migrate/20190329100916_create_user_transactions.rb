class CreateUserTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_transactions do |t|
      t.integer :user_id
      t.integer :tag_id
      t.integer :amount
      t.string  :tx_type
      t.timestamps
    end
  end
end
