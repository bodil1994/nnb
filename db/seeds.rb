require "open-uri"

# Destroy all records

Message.destroy_all
Chatroom.destroy_all
Transfer.destroy_all
LoanRequest.destroy_all
LoanPayment.destroy_all
Loan.destroy_all
WithdrawalRequest.destroy_all
Deposit.destroy_all
BankAccount.destroy_all
Wallet.destroy_all
User.destroy_all
puts "everything destroyed"

puts ""

# Load seed files

Dir[Rails.root.join('db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end
