class LoanPayment < ApplicationRecord
  belongs_to :loan
  belongs_to :tranfers, optional: true

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
