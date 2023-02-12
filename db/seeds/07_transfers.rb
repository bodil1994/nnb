puts ""
puts ""
puts "CREATING TRANSFERS FOR WALLETS"
puts ""

puts all_wallet = Wallet.all
loans = Loan.all

all_wallet.each do |wallet|
  puts ""
  puts "--------------"
  puts wallet
  3.times do
    puts "-----xxxxxxxxx---------"
    puts wallet
    # puts all_wallet.ids
    amount_transfer = [50, 75, 25, 15, 20, 35]
    amount = amount_transfer.sample
    transfer_status = ["Pending", "Approved", "Declined"]
    status = transfer_status.sample
    type = ["Withdrawal", "Deposit"]
    transfer_type = type.sample
    loan_id = loans.sample.id
    transfer = Transfer.create!(amount: amount, status: status, transfer_type: transfer_type, wallet: wallet, loan_id: loan_id)
    puts "Transfer to the wallet : #{wallet}, amount: #{amount}"
    transfer = Transfer.create!(amount: 100, status: status, transfer_type: transfer_type, wallet: wallet)
    puts "Transfer to the wallet : #{wallet}, amount: #{amount}"
  end
end
