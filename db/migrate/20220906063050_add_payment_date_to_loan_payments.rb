class AddPaymentDateToLoanPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :loan_payments, :payment_date, :date
    add_column :loan_payments, :payment_status, :string
  end
end
