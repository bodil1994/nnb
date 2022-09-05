class DepositsController < ApplicationController
  def new
    @deposit = Deposit.new
    @bank_accounts = current_user.bank_accounts
  end

  def create
    @deposit = Deposit.new(deposit_params)
    @deposit.wallet = current_user.wallet
    @deposit.status = "Submitted"
    if @deposit.save!
      redirect_to deposit_path(@deposit)
    else
      render :new
    end
  end

  def show
    @deposit = Deposit.find(params[:id])
  end

  def update
    @deposit = Deposit.find(params[:id])
    @deposit.status = "Pending"
    raise
    if @deposit.save
      redirect_to wallet_path(current_user.wallet), status: :see_other
    end
  end

  private

  def deposit_params
    params.require(:deposit).permit(:amount, :bank_account_id)
  end
end
