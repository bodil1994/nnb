puts ""
puts ""
puts "CREATING WITHDRAWALS FOR WALLETS"
puts ""

BankAccount.all.each do |account|
   3.times do
    withdrawal_status = ["Submitted", "Pending", "Approved", "Declined"]
    reference = ["ZZ111", "WW2222", "XX3333", "YY4444", "MM5555", "NN666", "OO7777", "PP8888"]
    amount_withdrawal = [50, 75, 100, 150, 250, 300]

    amount = amount_withdrawal.sample
    wallet_id = account.user.wallet.id
    bank_account_id = account.id
    status = withdrawal_status.sample
    withdraw = WithdrawalRequest.create!(amount: amount, wallet_id: wallet_id, status: status, bank_account_id: bank_account_id)
    puts "withdrawal added for wallet : #{wallet_id}, amount: #{amount}"
  end
end
