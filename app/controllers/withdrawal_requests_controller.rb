class WithdrawalRequestsController < ApplicationController
  def new
    @withdrawal_request = WithdrawalRequest.new
    @bank_accounts = current_user.bank_accounts
  end

  def create
    @withdrawal_request = WithdrawalRequest.new(withdrawal_request_params)
    @withdrawal_request.wallet = current_user.wallet
    @withdrawal_request.bank_account = BankAccount.first
    @withdrawal_request.status = "Pending"
    if @withdrawal_request.save!
      redirect_to withdrawal_request_path(@withdrawal_request)
    else
      render :new
    end
  end

  def show
    @withdrawal_request = WithdrawalRequest.find(params[:id])
  end

  def update
    @withdrawal_request = WithdrawalRequest.find(params[:id])
    @withdrawal_request.status = "Approved"
    if @withdrawal_request.save
      UpdateWalletService.new(borrower_transaction: @withdrawal_request, lender_transaction: "", borrower_wallet: current_user.wallet, lender_wallet: " ").call
      redirect_to wallet_path(current_user.wallet), status: :see_other
    end
  end

  private

  def withdrawal_request_params
    params.require(:withdrawal_request).permit(:amount)
  end
end
