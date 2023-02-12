# This creates a bunch of bank accounts for each user.
puts ""
puts ""
puts "CREATING BANK ACCOUNTS"
puts ""

bank_types = ["Bank", "Mobile money"]
User.all.each do |user|
  3.times do
    bank_name = Faker::Bank.name
    account_number = Faker::Bank.account_number
    bank_type = bank_types.sample
    swift_number = Faker::Bank.swift_bic
    ba = BankAccount.create!(bank_name: bank_name, account_number: account_number, bank_type: bank_type, swift_number: swift_number, user: user)
    puts "bank account #{ba.bank_name} added for #{user.first_name}"
  end
end
