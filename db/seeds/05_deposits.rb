puts ""
puts ""
puts "CREATING DEPOSITS FOR WALLETS"
puts ""

BankAccount.all.each do |account|
   3.times do
    deposit_status = ["Submitted", "Pending", "Approved", "Declined"]
    reference = ["AA111", "BB2222", "CC3333", "DD4444", "EE5555", "FF666", "GG7777", "HH8888"]
    amount_transaction = [100, 200, 300, 500, 800, 1000]
    amount = amount_transaction.sample
    wallet_id = account.user.wallet.id
    status = deposit_status.sample
    deposit_reference = reference.sample
    bank_account_id = account.id
    depo = Deposit.create!(amount: amount, wallet_id: wallet_id, status: status, deposit_reference: deposit_reference, bank_account_id: bank_account_id)
    puts "deposit added for wallet : #{wallet_id}, amount: #{amount}"
  end
end
