class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :withdrawal_requests

  BANK_TYPES = ["Bank", "Mobile app"]
  validates :account_number, presence: true
  validates :bank_name, presence: true
  validates :bank_type, inclusion: { in: BANK_TYPES }
end
