require 'faker'

@user = User.create(username: "GaryGygax", email: Faker::Internet.email, password: Faker::Internet.password)