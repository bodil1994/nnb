class Wallet < ApplicationRecord
  belongs_to :user
  has_many :withrawal_requests
  has_many :deposits
 # validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
