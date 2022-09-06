class LoanPayment < ApplicationRecord
  belongs_to :loan

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_create :set_profit

  def set_profit
    total_profit = self.loan.interest_rate * self.amount
    self.update(profit: total_profit)
  end
end
