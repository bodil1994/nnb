class Wallet < ApplicationRecord
  belongs_to :user
  has_many :withrawal_requests
  has_many :deposits

  after_create_commit :update_amount

  def update_amount
    self.amount = 0 if self.amount.nil?
    self.save
  end
end
