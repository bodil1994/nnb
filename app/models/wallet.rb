class Wallet < ApplicationRecord
  belongs_to :user
  has_many :withrawal_requests
  has_many :deposits

  after_create_commit :update_amount
  validates :amount, numericality: {greater_than_or_equal_to: 0}

  def update_amount
    self.amount = 0 if self.amount.nil?
    self.save
  end

end
