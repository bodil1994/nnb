class WalletTransaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :withdrawal_request, optional: true

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
