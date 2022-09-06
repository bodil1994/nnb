class AddAcceptedAtToLoanRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :loan_requests, :accepted_at, :date
    add_column :loan_requests, :declined_at, :date
  end
end
