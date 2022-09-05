class Deposit < ApplicationRecord
  belongs_to :wallet
  belongs_to :bank_account
  has_many :users, through: :wallet

  DEPOSIT_REQUEST_STATUS = ["Submitted", "Pending", "Approved", "Declined"]
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: DEPOSIT_REQUEST_STATUS }
end
