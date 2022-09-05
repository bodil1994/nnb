class PagesController < ApplicationController
  def lender_dashboard
    @amount = current_user.wallet.amount.nil? ? 0 : current_user.wallet.amount
  end

  def borrower_dashboard
    @amount = current_user.wallet.amount.nil? ? 0 : current_user.wallet.amount
  end

  def transactions
      @user = current_user
  end
end
