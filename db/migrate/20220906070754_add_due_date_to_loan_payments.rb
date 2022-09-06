class AddDueDateToLoanPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :loan_payments, :due_date, :date
    add_reference :loan_payments, :transfer, null: false, foreign_key: true
  end
end
