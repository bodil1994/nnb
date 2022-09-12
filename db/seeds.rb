require "open-uri"


# DESTROY ALL

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


# CREATE LENDERS
puts "CREATING LENDERS"

first_name = "Sam"
last_name = "Banana"
profession = "Web developer"
email = "info@sam.com"
phone = "0199887682"
address = "Sydney, Australia"
password ="123123"
user_type = "Lender"
sam = User.new(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password, user_type: user_type)
file = URI.open("https://i.pinimg.com/originals/af/02/e6/af02e644e673cbb71d0cd886306e8274.jpg")
sam.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
sam.save!
puts "new user added: #{sam.first_name} #{sam.last_name}"

first_name = "Bodil"
last_name = "Hundevad"
profession = "Fullstack Developer"
email = "bodil@hundevad.de"
phone = "08899899982"
address = "Vienna, Austria"
password ="123123"
user_type = "Lender"
bodil = User.new(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password, user_type: user_type)
file = URI.open("https://ca.slack-edge.com/T02NE0241-U03NVAPFBGV-cf08ead93701-512")
bodil.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
bodil.save!
puts "new user added: #{bodil.first_name} #{bodil.last_name}"


first_name = "Sarah"
last_name = "Baum"
profession = "Influencer"
email = "info@sarah.com"
phone = "08899887682"
address = "London, England"
password ="123123"
user_type = "Lender"
sarah = User.new(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password, user_type: user_type)
file = URI.open("https://i.pinimg.com/736x/7a/d3/1a/7ad31af11e1108ed093eca1b3438bc25.jpg")
sarah.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
sarah.save!
puts "new user added: #{sarah.first_name} #{sarah.last_name}"
puts ""


# CREATE BORROWERS

puts "CREATING BORROWERS"

first_name = "Valentina"
last_name = "Begona"
profession = "Marketing"
email = "info@valentina.com"
phone = "08899887682"
address = "Barcelona, Spain"
password ="123123"
user_type = "Borrower"
valentina = User.new(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password, user_type: user_type)
file = URI.open("https://static.vecteezy.com/system/resources/thumbnails/001/258/097/small_2x/beautiful-spanish-woman-smiling.jpg")
valentina.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
valentina.save!
puts "new user added: #{valentina.first_name} #{valentina.last_name}"

first_name = "Ben"
last_name = "Blue"
profession = "Gojek driver"
email = "info@ben.com"
phone = "08899899982"
address = "Amsterdam, Holland"
password ="123123"
user_type = "Borrower"
ben = User.new(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password, user_type: user_type)
file = URI.open("https://i.pinimg.com/originals/d8/a0/1e/d8a01e34926bdb7eb9e1fb506d0aea1b.jpg")
ben.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
ben.save!
puts "new user added: #{ben.first_name} #{ben.last_name}"

first_name = "Franka"
last_name = "Weiler"
profession = "Fullstack Developer"
email = "franka@gmail.com"
phone = "08899899982"
address = "Berlin, Germany"
password ="123123"
user_type = "Borrower"
franka = User.new(first_name: first_name, last_name: last_name, profession: profession, email: email, phone: phone, address: address, password: password, user_type: user_type)
file = URI.open("https://ca.slack-edge.com/T02NE0241-U03NF0X32TV-816358aee467-512")
franka.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
franka.save!
puts "new user added: #{franka.first_name} #{franka.last_name}"

# CREATING WALLETS

puts ""
puts "CREATING WALLETS"

all_users = User.all
all_users.each do |user|

  if user.first_name == "Bodil"
    amount = 2000
  else
    amount = 1000
  end
  Wallet.create!(user: user, amount: amount)

  puts "new wallet added for User #{user.email}"
end

# CREATE LOANS
puts ""
puts "CREATING LOANS"

# ---------- Bodil health loan
puts "Bodil Loans and requests"
amount = 1000
interest_rate = 10
loan_category = "Health"
instant_loan = false
status = "Closed"
payback_time = 365
payment_frequency = "Monthly"
user = bodil
loan_bodil_health = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{loan_bodil_health.user.first_name}: #{loan_bodil_health.amount}€ for #{loan_bodil_health.loan_category} with interest rate of #{loan_bodil_health.interest_rate}%"
chatroom = Chatroom.create!(loan: loan_bodil_health)
puts "chatrooom num #{chatroom.id}"

amount = 1000
title = "Hospital bills for my mother"
description = "My mother is sick and I need to pay the hospitals bills."
loan_category = "Health"
status = "Active"
loan = loan_bodil_health
user = ben
accepted_at = Date.new(2019,2,25)
education_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan, accepted_at: accepted_at)
puts "new loan request added: #{education_loan_request.amount}€ for #{education_loan_request.loan_category}"

loan = loan_bodil_health
amount = 91.66
date = Date.new(2019,2,25)
num = 0
while num < 12
  due_date = date.next_month
  if due_date < Date.today
    payment_status = "Completed"
    transfer_status = "Approved"
    transfer_type = "Deposit"
    wallet = bodil.wallet
    created_at = DateTime.new(due_date.year, due_date.mon, due_date.mday, 0, 0, 0)
    transfer = Transfer.create!(amount: amount, status: transfer_status, transfer_type: transfer_type, wallet: wallet, loan: loan, created_at: created_at)
  else
    payment_status = "Scheduled"
  end
  payment = LoanPayment.new(loan: loan, amount: amount, due_date: due_date, payment_status: payment_status)
  if due_date < Date.today
    payment.payment_date = due_date
  end
  payment.save!
  date = due_date
  num += 1

  puts "loan payment added for #{payment.loan}"
end
# ------------------------

# --------- Bodil education loan
amount = 2000
interest_rate = 8
loan_category = "Education"
instant_loan = false
status = "Active"
payback_time = 180
payment_frequency = "Monthly"
user = bodil
bodil_education_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{bodil_education_loan.user.first_name}: #{bodil_education_loan.amount}€ for #{bodil_education_loan.loan_category} with interest rate of #{bodil_education_loan.interest_rate}%"
chatroom = Chatroom.create!(loan: bodil_education_loan)
puts "chatrooom num #{chatroom.id}"

amount = 2000
title = "Paying my tuition fees"
description = "I need the money to pay for my university tuition fees."
loan_category = "Education"
status = "Active"
# loan = Loan.find_by(loan_category: "Education")
loan = bodil_education_loan
user = franka
accepted_at = Date.new(2022,5,15)
education_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan, accepted_at: accepted_at)
puts "new loan request added: #{education_loan_request.amount}€ for #{education_loan_request.loan_category}"

loan = bodil_education_loan
amount = 360
date = Date.new(2022,5,15)
num = 0
while num < 6
  due_date = date.next_month
  if due_date < Date.today
    payment_status = "Completed"
    transfer_status = "Approved"
    transfer_type = "Deposit"
    wallet = bodil.wallet
    created_at = DateTime.new(due_date.year, due_date.mon, due_date.mday, 0, 0, 0)
    transfer = Transfer.create!(amount: amount, status: transfer_status, transfer_type: transfer_type, wallet: wallet, loan: loan, created_at: created_at)
  else
    payment_status = "Scheduled"
  end
  payment = LoanPayment.new(loan: loan, amount: amount, due_date: due_date, payment_status: payment_status)
  if due_date < Date.today
    payment.payment_date = due_date
  end
  payment.save!
  date = due_date
  num += 1

  puts "loan payment added for #{payment.loan}"
end
# ----------------------------

# --------- Bodil education loan 2
amount = 3000
interest_rate = 10
loan_category = "Education"
instant_loan = true
status = "Closed"
payback_time = 180
payment_frequency = "Monthly"
user = bodil
bodil_education_loan_2 = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{bodil_education_loan_2.user.first_name}: #{bodil_education_loan_2.amount}€ for #{bodil_education_loan_2.loan_category} with interest rate of #{bodil_education_loan_2.interest_rate}%"
chatroom = Chatroom.create!(loan: bodil_education_loan_2)
puts "chatrooom num #{chatroom.id}"

amount = 3000
title = "Paying for professional development courses"
description = "I want to take some extra courses to add skills and help advance my career."
loan_category = "Education"
status = "Active"
# loan = Loan.find_by(loan_category: "Education")
loan = bodil_education_loan_2
user = valentina
accepted_at = Date.new(2021,5,15)
education_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan, accepted_at: accepted_at)
puts "new loan request added: #{education_loan_request.amount}€ for #{education_loan_request.loan_category}"

loan = bodil_education_loan_2
amount = 550
date = accepted_at
num = 0
while num < 6
  due_date = date.next_month
  if due_date < Date.today
    payment_status = "Completed"
    transfer_status = "Approved"
    transfer_type = "Deposit"
    wallet = bodil.wallet
    created_at = DateTime.new(due_date.year, due_date.mon, due_date.mday, 0, 0, 0)
    transfer = Transfer.create!(amount: amount, status: transfer_status, transfer_type: transfer_type, wallet: wallet, loan: loan, created_at: created_at)
  else
    payment_status = "Scheduled"
  end
  payment = LoanPayment.new(loan: loan, amount: amount, due_date: due_date, payment_status: payment_status)
  if due_date < Date.today
    payment.payment_date = due_date
  end
  payment.save!
  date = due_date
  num += 1

  puts "loan payment added for #{payment.loan}"
end
# ----------------------------

# ------------- Bodil Business Loan
amount = 1000
interest_rate = 9
loan_category = "Business"
instant_loan = false
status = "Active"
payback_time = 365
user = bodil
payment_frequency = "Monthly"
bodil_business_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added: #{bodil_business_loan.amount}€ for #{bodil_business_loan.loan_category} with interest rate of #{bodil_business_loan.interest_rate}%"
chatroom = Chatroom.create!(loan: bodil_business_loan)
puts "chatrooom num #{chatroom.id}"

amount = 1000
title = "Initial Investment for my new business"
description = "I'm starting a fruit stand, and need money for the initial expenses to start my business."
loan_category = "Business"
status = "Active"
loan = bodil_business_loan
user = ben
accepted_at = Date.new(2022,1,3)
business_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan, accepted_at: accepted_at)
puts "new loan request added: #{business_loan_request.amount}€ for #{business_loan_request.loan_category}"

loan = bodil_business_loan
amount = 90.83
date = Date.new(2022,3,15)
num = 0
while num < 12
  due_date = date.next_month
  if due_date < Date.today
    payment_status = "Completed"
    transfer_status = "Approved"
    transfer_type = "Deposit"
    wallet = bodil.wallet
    created_at = DateTime.new(due_date.year, due_date.mon, due_date.mday, 0, 0, 0)
    transfer = Transfer.create!(amount: amount, status: transfer_status, transfer_type: transfer_type, wallet: wallet, loan: loan, created_at: created_at)
  else
    payment_status = "Scheduled"
  end
  payment = LoanPayment.new(loan: loan, amount: amount, due_date: due_date, payment_status: payment_status)
  if due_date < Date.today
    payment.payment_date = due_date
  end
  payment.save!
  date = due_date
  num += 1

  puts "loan payment added for #{payment.loan}"
end
# ----------------------------


amount = 200
interest_rate = 7
loan_category = "Education"
instant_loan = true
status = "Pending"
payback_time = 365
payment_frequency = "Monthly"
user = sam
education_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{education_loan.user.first_name}: #{education_loan.amount}€ for #{education_loan.loan_category} with interest rate of #{education_loan.interest_rate}%"
chatroom = Chatroom.create!(loan: education_loan)
puts "chatrooom num #{chatroom.id}"

amount = 1000
interest_rate = 8
loan_category = "Health"
instant_loan = false
status = "Listed"
payback_time = 180
payment_frequency = "Monthly"
user = sam
education_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{education_loan.user.first_name}: #{education_loan.amount}€ for #{education_loan.loan_category} with interest rate of #{education_loan.interest_rate}%"
chatroom = Chatroom.create!(loan_id: education_loan.id)
puts "chatrooom num #{chatroom.id}"

amount = 600
interest_rate = 10
loan_category = "Business"
instant_loan = false
status = "Pending"
payback_time = 180
payment_frequency = "Monthly"
user = sam
education_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{education_loan.user.first_name}: #{education_loan.amount}€ for #{education_loan.loan_category} with interest rate of #{education_loan.interest_rate}%"
chatroom = Chatroom.create!(loan_id: education_loan.id)
puts "chatrooom num #{chatroom.id}"

amount = 450
interest_rate = 12
loan_category = "Insurance"
instant_loan = false
status = "Active"
payback_time = 150
payment_frequency = "Monthly"
user = sam
insurance_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{insurance_loan.user.first_name}: #{insurance_loan.amount}€ for #{insurance_loan.loan_category} with interest rate of #{insurance_loan.interest_rate}%"
chatroom = Chatroom.create!(loan_id: insurance_loan.id)
puts "chatrooom num #{chatroom.id}"

amount = 450
title = "Health Insurance for my kid"
description = "New requests I need the money to pay for my two children's health insurance."
loan_category = "Insurance"
status = "Active"
loan = insurance_loan
user = ben
accepted_at = Date.new(2022,1,3)
education_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan, accepted_at: accepted_at)
puts "new loan request added: #{education_loan_request.amount}€ for #{education_loan_request.loan_category}"

amount = 100
interest_rate = 5
loan_category = "Health"
instant_loan = false
status = "Pending"
payback_time = 180
payment_frequency = "Monthly"
user = sam
health_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{education_loan.user.first_name}: #{education_loan.amount}€ for #{education_loan.loan_category} with interest rate of #{education_loan.interest_rate}%"
chatroom = Chatroom.create!(loan_id: health_loan.id)
puts "chatrooom num #{chatroom.id}"

amount = 400
interest_rate = 5
loan_category = "Business"
instant_loan = false
status = "Listed"
payback_time = 60
user = sarah
payment_frequency = "Monthly"
business_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added: #{business_loan.amount}€ for #{business_loan.loan_category} with interest rate of #{business_loan.interest_rate}%"

amount = 400
title = "Start a business"
description = "I need the money to start my new business."
loan_category = "Business"
status = "Pending"
loan = business_loan
user = ben
education_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan)
puts "new loan request added: #{education_loan_request.amount}€ for #{education_loan_request.loan_category}"

amount = 200
title = "Paying school fees for my children"
description = "I need the money to pay for my two children's tuition fees, as well as for their books, their school uniform and their food."
loan_category = "Education"
status = "Pending"
loan = education_loan
user = ben
education_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan)
puts "new loan request added: #{education_loan_request.amount}€ for #{education_loan_request.loan_category}"

amount = 200
title = "Money for tution"
description = "I need the money to pay for tuition."
loan_category = "Education"
status = "Pending"
loan = education_loan
user = franka
education_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan)
puts "new loan request added: #{education_loan_request.amount}€ for #{education_loan_request.loan_category}"

amount = 100
interest_rate = 5
loan_category = "Health"
instant_loan = true
status = "Listed"
payback_time = 90
user = sarah
payment_frequency = "Monthly"
health_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added: #{health_loan.amount}€ for #{health_loan.loan_category} with interest rate of #{health_loan.interest_rate}%"


bank_types = ["Bank", "Mobile money"]
all_users.each do |user|
  3.times do
    bank_name = Faker::Bank.name
    account_number = Faker::Bank.account_number
    bank_type = bank_types.sample
    swift_number = Faker::Bank.swift_bic
    ba = BankAccount.create!(bank_name: bank_name, account_number: account_number, bank_type: bank_type, swift_number: swift_number, user: user)
    puts "bank account added for #{user.first_name} #{user.last_name}"
  end
end

loan_sam = Loan.find_by(user: sam, status: "Active")
amount = 17.08
date = Date.new(2022,6,1)
num = 0
while num < 12
  due_date = date.next_month
  if due_date < Date.today
    payment_status = "Completed"
  else
    payment_status = "Scheduled"
  end
  payment = LoanPayment.new(loan: loan_sam, amount: amount, due_date: due_date, payment_status: payment_status)
  if due_date < Date.today
    payment.payment_date = due_date
  end
  payment.save!
  date = due_date
  num += 1

  puts "loan payment added for #{payment.loan}"
end


  # all_deposits = Deposit.all
  all_account = BankAccount.all

  # Seeds for deposit

    all_account.each do |account|
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

  all_account = BankAccount.all

  all_account.each do |account|
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

 puts all_wallet = Wallet.all
 loan = Loan.all

 all_wallet.each do |wallet|
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
    loan_id = loan.sample.id
    transfer = Transfer.create!(amount: amount, status: status, transfer_type: transfer_type, wallet: wallet, loan_id: loan_id)
    puts "Transfer to the wallet : #{wallet}, amount: #{amount}"
    transfer = Transfer.create!(amount: 100, status: status, transfer_type: transfer_type, wallet: wallet)
    puts "Transfer to the wallet : #{wallet}, amount: #{amount}"
  end
end
