# This file creates wallets for all seeded users
puts ""
puts ""
puts "CREATING WALLETS"
puts ""

User.all.each do |user|
  amount = (user.first_name == "Bodil" ? 2000 : 1000)
  Wallet.create!(user: user, amount: amount)
  puts "new wallet added for user #{user.email} with amount #{amount}€"
end
