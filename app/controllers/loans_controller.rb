class LoansController < ApplicationController

  def show
    @loan = Loan.find(params[:id])
    @loan_request = @loan.loan_requests.where(status: "Active").first
    # @loan.loan_request = @loan_request
  end

  def index
    if params['length'].present? && params['amount'].present?
      length_in_days = params[:length].to_i * 30
      @loans = Loan.where("amount >= #{params[:amount].to_f}").where("payback_time <= #{length_in_days}")
    elsif params['amount'].present?
      @loans = Loan.where("amount >= #{params[:amount].to_f}")
    elsif params['length'].present?
      length_in_days = params[:length].to_i * 30
      @loans = Loan.where("payback_time <= #{length_in_days}")
    else
      @loans = Loan.all
    end

    if params['loan'].present?
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
    @loan.status = "Pending"
    if @loan.save
      redirect_to loan_summary_lender_path(@user)
    else
      render :new
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:amount, :payback_time, :payment_frequency, :interest_rate, :loan_category, :instant_loan)
  end
end
