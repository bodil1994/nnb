class LoanRequestsController < ApplicationController
  before_action :set_loan
  def new
    # To create a new loan request
    # I need to find the loan id which comes from the url /loans/:loan_id/loan_requests/new(.:format
    # Need to take into the pages
    @loan_request = LoanRequest.new
    @loan_request.loan_id = @loan
    @loan_request.save
    raise
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
