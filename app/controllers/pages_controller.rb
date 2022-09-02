class PagesController < ApplicationController
  def lender_dashboard
    @amount = current_user.wallet.amount? ? current_user.wallet.amount : 0
  end

  def borrower_dashboard
    @amount = current_user.wallet.amount? ? current_user.wallet.amount : 0
  end
end
