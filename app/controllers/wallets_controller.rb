class WalletsController < ApplicationController

  def show
    @user = current_user
    @wallet = @user.wallet
    # Create an empyt array called all_transactions
    @all_transactions = []
    #  deposts + with + transfers
    # create an empty array called all_withdrawal and add it all the WithdrawalRequest
    all_withdrawals = []
    all_withdrawals = WithdrawalRequest.where(wallet_id: @user.wallet)

    #   Add to all_transactions << all  deposit transaction related to the current user
    all_deposits = []
    all_deposits = Deposit.where(wallet_id: @user.wallet)
    #   Add to all_transactions << all  transfers transaction related to the current user
      # all_transfers = []
      # all_transfers = Transfer.where(wallet_id: @user.wallet)
    # Add all transactioin to the all_transactions array
    @all_transactions << (all_withdrawals + all_deposits)

    #use flatten in order to create a single array
    @all_transactions = @all_transactions.flatten

    #   Display thhe Filter the array by date desc with amount, date, status, "description = bank, mobil money, No Name Bank"
    @all_transactions = @all_transactions.sort_by { |transaction| transaction.created_at }
    # Display the last 5 which should be the most recent transactionss
    @all_transactions = @all_transactions.last(5)

  end
end
