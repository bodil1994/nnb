class AddAmountToWallet < ActiveRecord::Migration[7.0]
  def change
    add_column :wallets, :amount, :float
  end
end
