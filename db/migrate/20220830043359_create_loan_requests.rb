class CreateLoanRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :loan_requests do |t|
      t.float :amount
      t.string :title
      t.text :description
      t.string :loan_category
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :loan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
