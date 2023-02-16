# This file creates wallets for all seeded users
puts ""
puts ""
puts "ADDING FUNDS TO WALLETS"
puts ""

User.all.each do |user|
  amount = (user.first_name == "Bodil" ? 2000 : 1000)
  user.wallet.update(amount: amount)
  puts "initial wallet amount for #{user.email} set to #{amount}€"
end
