class LoansController < ApplicationController

  def show
    @loan = Loan.find(params[:id])
  end

  def index
    @loans = Loan.all
  end
  
  def new
    @loan = Loan.new
  end

  def create
    @user = current_user
    @loan = Loan.new(loan_params)
    @loan.user = @user
    if @loan.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:payback_time, :payment_frequency, :interest_rate, :loan_category, :instant_loan)
  end
end
