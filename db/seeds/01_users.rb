# This file creates users
require "open-uri"

puts ""
puts ""
puts "CREATING USERS"
puts ""

users = [
  {
    first_name: 'Sam',
    last_name: 'Banana',
    profession: 'Web developer',
    email: 'info@sam.com',
    phone: '0199887682',
    address: 'Sydney, Australia',
    password: '123123',
    user_type: 'Lender',
    image_url: 'https://i.pinimg.com/originals/af/02/e6/af02e644e673cbb71d0cd886306e8274.jpg'
  },
  {
    first_name: 'Bodil',
    last_name: 'Hundevad',
    profession: 'Fullstack developer',
    email: 'bodil@hundevad.de',
    phone: '08899899982',
    address: 'Vienna, Austria',
    password: '123123',
    user_type: 'Lender',
    image_url: 'https://ca.slack-edge.com/T02NE0241-U03NVAPFBGV-cf08ead93701-512',
  },
  {
    first_name: 'Sarah',
    last_name: 'Baum',
    profession: 'Influencer',
    email: 'info@sarah.com',
    phone: '08899887682',
    address: 'London, England',
    password: '123123',
    user_type: 'Lender',
    image_url: 'https://i.pinimg.com/736x/7a/d3/1a/7ad31af11e1108ed093eca1b3438bc25.jpg',
  },
  {
    first_name: "Valentina",
    last_name: "Begona",
    profession: "Marketing",
    email: "info@valentina.com",
    phone: "08899887682",
    address: "Barcelona, Spain",
    password: "123123",
    user_type: "Borrower",
    image_url: "https://static.vecteezy.com/system/resources/thumbnails/001/258/097/small_2x/beautiful-spanish-woman-smiling.jpg"
  },
  {
    first_name: "Ben",
    last_name: "Blue",
    profession: "Gojek driver",
    email: "info@ben.com",
    phone: "08899899982",
    address: "Amsterdam, Holland",
    password: "123123",
    user_type: "Borrower",
    image_url: "https://i.pinimg.com/originals/d8/a0/1e/d8a01e34926bdb7eb9e1fb506d0aea1b.jpg"
  },
  {
    first_name: "Franka",
    last_name: "Weiler",
    profession: "Fullstack Developer",
    email: "franka@gmail.com",
    phone: "08899899982",
    address: "Berlin, Germany",
    password: "123123",
    user_type: "Borrower",
    image_url: "https://ca.slack-edge.com/T02NE0241-U03NF0X32TV-816358aee467-512"
  }
]

users.each do |details|
  user_details = details.except(:image_url)
  user = User.new(user_details)

  file = URI.open(details[:image_url])
  user.photo.attach(io: file, filename: "profile.jpg", content_type: "image/jpg")

  user.save!
  puts "new user added: #{user.first_name} #{user.last_name}"
end
