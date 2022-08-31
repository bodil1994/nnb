class LoanRequest < ApplicationRecord
  belongs_to :user
  belongs_to :loan

  LOAN_CATEGORIES = ["Education", "Health", "Insurance", "Business"]
  LOAN_REQUEST_STATUS = ["Pending", "Approved", "Declined", "Cancelled"]
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :loan_category, inclusion: { in: LOAN_CATEGORIES }
  validates :status, inclusion: { in: LOAN_REQUEST_STATUS }

end
