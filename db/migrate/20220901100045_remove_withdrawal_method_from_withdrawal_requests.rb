class RemoveWithdrawalMethodFromWithdrawalRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :withdrawal_requests, :withdrawal_method, :string
  end
end
