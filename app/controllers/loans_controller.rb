class LoansController < ApplicationController
  def show
    @loan = Loan.find(params[:id])
  end

  def index
    @loans = Loan.all
  end
end
