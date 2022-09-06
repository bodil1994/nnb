class WithdrawalRequest < ApplicationRecord
  belongs_to :wallet
  belongs_to :bank_account
  has_many :users, through: :wallet

  WITHDRAWAL_REQUEST_STATUS = ["Submitted", "Pending", "Approved", "Declined"]
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: Proc.new {|withdrawal_request| withdrawal_request.wallet.amount} }
  validates :status, inclusion: { in: WITHDRAWAL_REQUEST_STATUS }
end
