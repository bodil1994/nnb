class Chatroom < ApplicationRecord
  belongs_to :loan
  has_many :messages

  def borrower
    loan.loan_requests.find_by(status: "Active").user
  end

  def loan_request
    loan.loan_requests.find_by(status: "Active").id
  end
end
