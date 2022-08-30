LoanPayment.destroy_all
LoanRequest.destroy_all
Loan.destroy_all
WalletTransaction.destroy_all
Wallet.destroy_all
WithdrawalRequest.destroy_all
User.destroy_all

puts "everything destroyed"

first_name = "Sam"
last_name = "Banana"
profession = "Web developer"
email = "info@sam.com"
phone = "0199887682"
address = "Frii Hotel Bali"
password ="123123"
type = "Lender"
sam = User.create!(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password)
puts "new user added: #{sam.first_name} #{sam.last_name}"

first_name = "Ben"
last_name = "Blue"
profession = "Gojek driver"
email = "info@ben.com"
phone = "0199899992"
address = "Canggu Bali"
password ="123123"
type = "Borrower"
ben = User.create!(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password)
puts "new user added: #{ben.first_name} #{ben.last_name}"

amount = 200
title = "Paying school fees for my children"
description = "I need the money to pay for my two children's tuition fees, as well as for their books, their school uniform and their food."
loan_category = "Education"
status = "Pending"
user_id = 2
loan_id = 1
education_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user_id: user_id, loan_id: loan_id)
puts "new loan request added: #{amount}€ for #{loan_category}"

amount = 200
interest_rate = 2
loan_category "Education"
instant_loan = false
status = "Listed"
payback_time = 1
user_id = 1
education_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, user_id: user_id)
puts "new loan added: #{amount}€ for #{loan_category} with interest rate of #{interest_rate}%"
