class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @loan_request = LoanRequest.find(params[:loan_request_id])
 end

end
