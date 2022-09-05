class PagesController < ApplicationController
  def lender_dashboard
    @amount = current_user.wallet.amount.nil? ? 0 : current_user.wallet.amount
  end

  def borrower_dashboard
    @amount = current_user.wallet.amount.nil? ? 0 : current_user.wallet.amount
  end

  def transactions
    @user = current_user
    @wallet = @user.wallet
    # Create an empyt array called all_transactions
    @all_transactions = []
    #  deposts + with + transfers
    # create an empty array called all_withdrawal and add it all the WithdrawalRequest
    all_withdrawals = WithdrawalRequest.where(wallet_id: @user.wallet)

    #   Add to all_transactions << all  deposit transaction related to the current user
    all_deposits = Deposit.where(wallet_id: @user.wallet)
    #   Add to all_transactions << all  transfers transaction related to the current user
      all_transfers = Transfer.where(wallet_id: @user.wallet)
    # Add all transactioin to the all_transactions array
    @all_transactions << (all_withdrawals + all_deposits + all_transfers)

    #use flatten in order to create a single array
    @all_transactions = @all_transactions.flatten

    #   Display thhe Filter the array by date desc with amount, date, status, "description = bank, mobil money, No Name Bank"
    @all_transactions = @all_transactions.sort_by { |transaction| transaction.created_at }
    # At this stage, the all_transactions is sorted ASC, we need to make it DESC
    @all_transactions = @all_transactions.reverse
    # Display the last 5 which should be the most recent transactionss
  end

  def portfolio
    @loans = Loan.where(user: current_user, status: "Active")
  end
end
