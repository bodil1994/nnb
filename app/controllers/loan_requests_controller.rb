require_relative '../services/update_wallet_service'
class LoanRequestsController < ApplicationController
  before_action :set_loan, except: [:show, :update]
  def new
    # To create a new loan request
    # I need to find the loan id which comes from the url /loans/:loan_id/loan_requests/new(.:format
    # Need to take into the pages
    @loan_request = LoanRequest.new
  end

  def create
    @loan_request = LoanRequest.new(loan_request_params)
    @loan_request.loan_id = @loan.id
    @loan_request.amount = @loan.amount
    @loan_request.loan_category = @loan.loan_category

    # Logic for the wallet based on a loan auto approval

    # Check if lender wallet are nil and set to 0
    if @loan.user.wallet.amount.nil?
      @loan.user.wallet.amount = 0
    end
    # Check if borrower wallet are nil and set to 0
    if current_user.wallet.amount.nil?
      current_user.wallet.amount = 0
    end
    # if loan.approval = auto
    if @loan.instant_loan?
    # Add the borrower transaction as a transfer
      borrower_amount = @loan.amount
      borrower_wallet = current_user.wallet
      loan_id = @loan.id

      transfer_status = "Approved"
      transfer_type = "Deposit"
      @borrower_transfer = Transfer.new(amount: borrower_amount, status: transfer_status, transfer_type: transfer_type, wallet: borrower_wallet, loan_id: loan_id)

     # Add the lender transaction as a transfer
      lender_amount = @loan.amount
      lender_wallet = @loan.user.wallet
      loan_id = @loan.id
      transfer_status = "Approved"
      transfer_type = "Withdrawal"
      @lender_transfer = Transfer.new(amount: lender_amount, status: transfer_status, transfer_type: transfer_type, wallet: lender_wallet, loan_id: loan_id)

    # and change the loan_request.status to Approved
     if @lender_transfer.save! && @borrower_transfer.save!
      @loan_request.status = "Active"
      UpdateWalletService.new(borrower_transaction: @borrower_transfer, lender_transaction: @lender_transfer, borrower_wallet: borrower_wallet, lender_wallet: lender_wallet, transaction_type: "Transfer").call
     end
    # Else set loan_request.status to On process
    else
     @loan_request.status = "Pending"
    end

    @loan_request.user = current_user
    if @loan_request.save
      redirect_to loan_request_path(@loan_request.id)
    else
      render :new
    end
  end

  def show
    @loan_request = LoanRequest.find(params[:id])
    @loan = Loan.find(@loan_request.loan_id)
  end

  def update
    @loan_request = LoanRequest.find(params[:id])
    @loan_request.status = params[:status]
    @loan = @loan_request.loan
    if @loan_request.save
      if params[:status] == "Active"
        @loan.status = "Active"
      end
      respond_to do |format|
        format.json { render :show, status: :ok, location: @loan_request }
        format.html { redirect_to request.referer }
      end
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end

  def loan_request_params
    params.require(:loan_request).permit(:description, :status)
  end

end
