class CreateWithdrawalRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :withdrawal_requests do |t|
      t.references :wallet, null: false, foreign_key: true
      t.float :amount
      t.string :withdrawal_method
      t.string :status

      t.timestamps
    end
  end
end
