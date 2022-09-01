LoanRequest.destroy_all
LoanPayment.destroy_all
Loan.destroy_all
WithdrawalRequest.destroy_all
Deposit.destroy_all
Wallet.destroy_all
User.destroy_all

puts "everything destroyed"

first_name = "Sam"
last_name = "Banana"
profession = "Web developer"
email = "info@sam.com"
phone = "0199887682"
address = "Frii Hotel Bali"
password ="123123"
user_type = "Lender"
sam = User.create!(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password, user_type: user_type)
puts "new user added: #{sam.first_name} #{sam.last_name}"


first_name = "Sarah"
last_name = "Baum"
profession = "Influencer"
email = "info@sarah.com"
phone = "08899887682"
address = "Frii Hotel Bali"
password ="123123"
user_type = "Lender"
sarah = User.create!(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password, user_type: user_type)
puts "new user added: #{sarah.first_name} #{sarah.last_name}"

first_name = "Ben"
last_name = "Blue"
profession = "Gojek driver"
email = "info@ben.com"
phone = "08899899982"
address = "Canggu Bali"
password ="123123"
user_type = "Borrower"
ben = User.create!(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password, user_type: user_type)
puts "new user added: #{ben.first_name} #{ben.last_name}"

amount = 200
interest_rate = 2
loan_category = "Education"
instant_loan = true
status = "Active"
payback_time = 365
payment_frequency = "monthly"
user = User.find_by(first_name: "Sam")
education_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{education_loan.user.first_name}: #{education_loan.amount}€ for #{education_loan.loan_category} with interest rate of #{education_loan.interest_rate}%"

amount = 1000
interest_rate = 5
loan_category = "Health"
instant_loan = false
status = "Listed"
payback_time = 180
payment_frequency = "monthly"
user = User.find_by(first_name: "Sam")
education_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{education_loan.user.first_name}: #{education_loan.amount}€ for #{education_loan.loan_category} with interest rate of #{education_loan.interest_rate}%"

amount = 200
title = "Paying school fees for my children"
description = "I need the money to pay for my two children's tuition fees, as well as for their books, their school uniform and their food."
loan_category = "Education"
status = "Pending"
loan = Loan.find_by(loan_category: "Education")
user = User.find_by(first_name: "Ben")
education_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan)
puts "new loan request added: #{education_loan_request.amount}€ for #{education_loan_request.loan_category}"


amount = 400
interest_rate = 5
loan_category = "Business"
instant_loan = false
status = "Listed"
payback_time = 2
user = User.find_by(first_name: "Sarah")
payment_frequency = "monthly"
business_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added: #{business_loan.amount}€ for #{business_loan.loan_category} with interest rate of #{business_loan.interest_rate}%"

amount = 100
interest_rate = 5
loan_category = "Health"
instant_loan = true
status = "Listed"
payback_time = 2
user = User.find_by(first_name: "Sarah")
payment_frequency = "monthly"
health_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added: #{health_loan.amount}€ for #{health_loan.loan_category} with interest rate of #{health_loan.interest_rate}%"

user_sam = User.find_by(first_name: "Sam")
amount_sam = 1000
wallet_sam = Wallet.create!(user: user_sam, amount: amount_sam)

puts "new wallet added for User #{wallet_sam.user.email}"

user = User.find_by(first_name: "Ben")
wallet_ben = Wallet.create!(user: user)
puts "new wallet added for User #{wallet_ben.user.email}"

user = User.find_by(first_name: "Sarah")
wallet_sarah = Wallet.create!(user: user)
puts "new wallet added for User #{wallet_sarah.user.email}"
