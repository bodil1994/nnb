class LoanRequestsController < ApplicationController
  before_action :set_loan
  def new
    # To create a new loan request
    # I need to find the loan id which comes from the url /loans/:loan_id/loan_requests/new(.:format
    # Need to take into the pages
    @loan_request = LoanRequest.new
    @loan_request.loan_id = @loan.id
    @loan_request.amount = @loan.amount
    @loan_request.loan_category = @loan.loan_category
    @loan_request.status = "Pending"
    @loan_request.user_id = current_user.id
    if @loan_request.save
      redirect_to loan_request_path(@loan_request.id)
    end
  end

  def create
  end

  def show
  end

  private

  def set_loan
  @loan = Loan.find(params[:loan_id])
  end

end
