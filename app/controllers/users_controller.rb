class UsersController < ApplicationController
  # GET / users / 1 / loan_requests / 1. Show information about a user's loan request spon its own page when requested.
  def show
    @user = User.find(params[:id])
    @loan_request = LoanRequest.find(params[:loan_request_id])
  end
end
