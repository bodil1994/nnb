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
      all_transfers = []
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
    @all_transactions = @all_transactions.first(5)
    raise
  end

  def update
    @user = current_user
    @wallet = @user.wallet
    @transfer = Transfer.all
    @withrawal = WithdrawalRequest.all
    @deposit = Deposit.all

    # Create an empyt array called total_amount
    @total_amount = []

    raise

    # Deposit
        # In the deposit table, grab all the deposit related to the wallet_id
        # Sum all deposit and store the sum in a variable
        total_deposit = @deposit.where(wallet_id: @user, status: "Approved")
        total_deposit.each do |deposit|
            sum_deposit = 0
            sum_deposit += deposit.amount
        end

        # In the transfer table, grab all the deposit related to the wallet_id
        # Sum all deposit and store the sum in a variable
        total_deposit_transfer = @transfer.where(wallet_id: @user,transfert_type: "Deposit", status:"Approved" )
        total_deposit_transfer.each do |transfer|
            sum_deposit_transfer = 0
            sum_deposit_transfer += transfer.amount
        end

        # sum the deposit from the deposit table and the transfer table
      total_all_deposit = sum_deposit + sum_deposit_transfer

    # Withdrawal
        # In the withdrawal table, grab all the withdrawal related to the wallet_id
        # Sum all withdrawal and store the sum in a variable
        total_withdrawal = @withrawal.where(wallet_id: @user, status: "Approved")
        total_withdrawal.each do |withdrawal|
            sum_withdrawal = 0
            sum_withdrawal += withdrawal.amount
        end

        # In the transfer table, grab all the withdrawal related to the wallet_id
        # Sum all withdrawal and store the sum in a variable
        total_withdrawal_transfer = @deposit.where(wallet_id: @user,transfert_type: "Withdrawal", status:"Approved" )
        total_withdrawal_transfer.each do |transfer|
            sum_withdrawal_transfer = 0
            sum_withdrawal_transfer += transfer.amount
        end

        # sum the withdrawal from the deposit table and the transfer table

        total_all_withdrawal = sum_withdrawal + sum_withdrawal_transfer

    # Calculate the amount
    total_amount = total_all_deposit  - total_all_withdrawal
    # Set the wallet amount to the total amount calculated
    @wallet.amount = total_amount

  end

end
