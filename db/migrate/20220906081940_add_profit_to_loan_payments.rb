class AddProfitToLoanPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :loan_payments, :profit, :float
  end
end
