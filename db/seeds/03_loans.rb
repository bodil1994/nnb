# CREATE LOANS
puts ""
puts ""
puts "CREATING LOANS"


# Define Users
bodil = User.find_by(first_name: 'Bodil')
sam = User.find_by(first_name: 'Sam')
ben = User.find_by(first_name: 'Ben')
sarah = User.find_by(first_name: 'Sarah')
franka = User.find_by(first_name: 'Franka')
valentina = User.find_by(first_name: 'Valentina')

# Define Bodils loans for demos
puts ""
puts "-Create Bodil' demo loan and requests:"

# Bodil's health loan and requests
puts ""
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
puts "chatroom num #{chatroom.id}"

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

  puts "loan repayment added for #{payment.loan}"
end


# Bodil's education loan and requests
puts ""
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


# Bodil's second education loan and requests
puts ""
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


# Bodil's business loan and requests
puts ""
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


# Define general loans and requests for search
puts ""
puts "-Created general loans and requests for search"
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
puts ""

amount = 1000
interest_rate = 8
loan_category = "Health"
instant_loan = false
status = "Listed"
payback_time = 180
payment_frequency = "Monthly"
user = sam
health_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{health_loan.user.first_name}: #{health_loan.amount}€ for #{health_loan.loan_category} with interest rate of #{health_loan.interest_rate}%"
chatroom = Chatroom.create!(loan_id: health_loan.id)
puts "chatrooom num #{chatroom.id}"
puts ""

amount = 600
interest_rate = 10
loan_category = "Business"
instant_loan = false
status = "Pending"
payback_time = 180
payment_frequency = "Monthly"
user = sam
business_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{business_loan.user.first_name}: #{business_loan.amount}€ for #{business_loan.loan_category} with interest rate of #{business_loan.interest_rate}%"
chatroom = Chatroom.create!(loan_id: business_loan.id)
puts "chatroom num #{chatroom.id}"
puts ""

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
puts "chatroom num #{chatroom.id}"
puts ""


amount = 100
interest_rate = 5
loan_category = "Health"
instant_loan = false
status = "Pending"
payback_time = 180
payment_frequency = "Monthly"
user = sam
health_loan = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added for user #{health_loan.user.first_name}: #{health_loan.amount}€ for #{health_loan.loan_category} with interest rate of #{education_loan.interest_rate}%"
chatroom = Chatroom.create!(loan_id: health_loan.id)
puts "chatrooom num #{chatroom.id}"
puts ""

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
chatroom = Chatroom.create!(loan_id: business_loan.id)
puts "chatrooom num #{chatroom.id}"
puts ""

amount = 100
interest_rate = 5
loan_category = "Health"
instant_loan = true
status = "Listed"
payback_time = 90
user = sarah
payment_frequency = "Monthly"
health_loan_2 = Loan.create!(amount: amount, interest_rate: interest_rate, loan_category: loan_category, instant_loan: instant_loan, status: status, payback_time: payback_time, payment_frequency: payment_frequency, user: user)
puts "new loan added: #{health_loan_2.amount}€ for #{health_loan_2.loan_category} with interest rate of #{health_loan_2.interest_rate}%"
chatroom = Chatroom.create!(loan_id: health_loan_2.id)
puts "chatrooom num #{chatroom.id}"
puts ""

amount = 450
title = "Health Insurance for my kid"
description = "New requests I need the money to pay for my two children's health insurance."
loan_category = "Insurance"
status = "Active"
loan = insurance_loan
user = ben
accepted_at = Date.new(2022,1,3)
insurance_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan, accepted_at: accepted_at)
puts "new loan request added: #{insurance_loan_request.amount}€ for #{insurance_loan_request.loan_category}"

amount = 400
title = "Start a business"
description = "I need the money to start my new business."
loan_category = "Business"
status = "Pending"
loan = business_loan
user = ben
business_loan_request = LoanRequest.create!(amount: amount, title: title, description: description, loan_category: loan_category, status: status, user: user, loan: loan)
puts "new loan request added: #{business_loan_request.amount}€ for #{business_loan_request.loan_category}"

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
puts ""

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
