require 'faker'

#Create Users
10.times do
  user = User.new(
          name:         Faker::Name.name,
          email:        Faker::Internet.email,
          password:     Faker::Lorem.characters(10) 
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

user = User.first
user.skip_confirmation!
user.update_attributes!(
  email: 'pam@positek.net',
  password: 'helloworld',
  name: 'Pam'
  )

50.times do
  Item.create!(
              user:         users.sample,
              name:         Faker::Lorem.sentence,
              created_at:   Faker::Date.backward(7)

  )
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"