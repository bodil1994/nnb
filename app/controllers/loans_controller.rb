class LoansController < ApplicationController

  def show
    @loan = Loan.find(params[:id])
  end

  def index
    if params
      @loans = Loan.where("amount >= #{params[:amount].to_f}")
    else
      @loans = Loan.all
    end

    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @loan = Loan.new
  end

  def create
    @user = current_user
    @loan = Loan.new(loan_params)
    @loan.user = @user
    if @loan.save
      redirect_to lender_loan_summary_path
    else
      render :new
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:payback_time, :payment_frequency, :interest_rate, :loan_category, :instant_loan)
  end
end
