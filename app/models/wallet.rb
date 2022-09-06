class Wallet < ApplicationRecord
  belongs_to :user
  has_many :withrawal_requests
  has_many :deposits

end
