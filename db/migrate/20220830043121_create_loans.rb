class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.float :amount
      t.float :interest_rate
      t.string :loan_category
      t.boolean :instant_loan
      t.string :status
      t.integer :payback_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
