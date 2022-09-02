class AddBankAccountIdToWithdrawalRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :withdrawal_requests, :bank_account, null: false, foreign_key: true
  end
end
