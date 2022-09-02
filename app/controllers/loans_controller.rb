class LoansController < ApplicationController

  def show
    @loan = Loan.find(params[:id])
    @loan_request = @loan.loan_requests.where(status: "Active").first
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
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    params[:loan][:instant_loan] == "Auto" ? @loan.instant_loan = true : @loan.instant_loan = false

    if params[:loan][:payback_time] == "Month"
      @loan.payback_time = 30
    elsif params[:loan][:payback_time] == "Week"
      @loan.payback_time = 7
    elsif params[:loan][:payback_time] == "Quarter"
      @loan.payback_time = 90
    else
      @loan.payback_time = 365
    end
    @loan.status = "Pending"
    @user = current_user

    if @loan.save!

      redirect_to loan_summary_lender_path(@loan)
    else
      render :new
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:amount, :payback_time, :payment_frequency, :interest_rate, :loan_category, :instant_loan)
  end
end
