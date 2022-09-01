class AddStatusToWalletTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :wallet_transactions, :status, :string
    add_reference :wallet_transactions, :bank_account, null: false, foreign_key: true
  end
end
