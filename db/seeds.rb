require 'faker'

20.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', team_name: Faker::Name.name)
end




