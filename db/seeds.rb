User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:false)

User.create!(name:  "Hai",
             email: "hai@gmail.com",
             password:              "123123",
             password_confirmation: "123123",
             admin: true)
User.create!(name:  "Hai",
             email: "bin@gmail.com",
             password:              "123123",
             password_confirmation: "123123",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               admin:false)
end