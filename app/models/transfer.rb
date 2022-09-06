class Transfer < ApplicationRecord
  belongs_to :loan, optional: true
  belongs_to :wallet
  has_one :loan_payment, dependent: :nullify
  TRANSFER_TYPE = ["Withdrawal", "Deposit"]
  TRANSFER_STATUS = ["Pending", "Approved", "Declined"]
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :transfer_type, presence: true, inclusion: { in: TRANSFER_TYPE  }
  validates :status, inclusion: { in: TRANSFER_STATUS}
end
