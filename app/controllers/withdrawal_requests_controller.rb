class WithdrawalRequestsController < ApplicationController
  def new
    @withdrawal_request = WithdrawalRequest.new
    @bank_accounts = current_user.bank_accounts
  end

  def create
  end
end
