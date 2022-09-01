class LoansController < ApplicationController

  def show
    @loan = Loan.find(params[:id])
  end

  def index
    if params['length'].present? && params['amount'].present?
      @loans = Loan.where("amount >= #{params[:amount].to_f}").where("payback_time <= #{params[:length]}")
    elsif params['amount'].present?
      @loans = Loan.where("amount >= #{params[:amount].to_f}")
    elsif params['length'].present?
      @loans = Loan.where("payback_time <= #{params[:length]}")
    else
      @loans = Loan.all
    end

    if params[:loan][:loan_category].present? && params[:loan][:loan_category].length > 1
      @loans = @loans.where(loan_category: params[:loan][:loan_category])
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
