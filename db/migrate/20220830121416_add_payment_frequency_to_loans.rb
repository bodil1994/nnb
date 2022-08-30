class AddPaymentFrequencyToLoans < ActiveRecord::Migration[7.0]
  def change
    add_column :loans, :payment_frequency, :string
  end
end
