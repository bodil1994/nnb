class LoanRequestsController < ApplicationController
  before_action :set_loan, except: :show
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
    # Increase the borrower wallet
      @loan.user.wallet.amount -= @loan.amount
      @loan.user.wallet.save
    # decrease the lender wallet
      current_user.wallet.amount += @loan.amount
      current_user.wallet.save
    # and change the loan_request.status to Approved
      @loan_request.status = "Approved"
    # Else set loan_request.status to On process
    else
    @loan_request.status = "On process"
    end

    @loan_request.user_id = current_user.id
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

  private

  def set_loan
  @loan = Loan.find(params[:loan_id])
  end

  def loan_request_params
    params.require(:loan_request).permit(:description)
  end

end
