class WithdrawalRequest < ApplicationRecord
  belongs_to :wallet

  WITHDRAWAL_METHODS = ["Orange", "Bank Transfer"]
  WITHDRAWAL_REQUEST_STATUS = ["Pending", "Approved", "Declined"]
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :withdrawal_method, inclusion: { in: WITHDRAWAL_METHODS }
  validates :status, inclusion: { in: WITHDRAWAL_REQUEST_STATUS }
end
