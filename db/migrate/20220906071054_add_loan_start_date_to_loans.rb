class AddLoanStartDateToLoans < ActiveRecord::Migration[7.0]
  def change
    add_column :loans, :loan_start_date, :date
  end
end
