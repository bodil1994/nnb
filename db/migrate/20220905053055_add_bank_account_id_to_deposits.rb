class AddBankAccountIdToDeposits < ActiveRecord::Migration[7.0]
  def change
    add_reference :deposits, :bank_account, null: false, foreign_key: true
  end
end
