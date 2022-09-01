class CreateDeposits < ActiveRecord::Migration[7.0]
  def change
    create_table :deposits do |t|
      t.float :amount
      t.string :status
      t.string :deposit_reference
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
