User.create!(name:  "Cuc Le", email: "cuc@gmail.com", password: "123456",
  password_confirmation: "123456", is_admin: true)

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password)
end

5.times do
  title = Faker::Lorem.sentence(3)
  question_number = Random.rand(20)
  Category.create!(title: title, question_number: question_number)
end
