class CreateWalletTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :wallet_transactions do |t|
      t.references :wallet, null: false, foreign_key: true
      t.float :amount
      t.references :withdrawal_request, null: true, foreign_key: true

      t.timestamps
    end
  end
end
