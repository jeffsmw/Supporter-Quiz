1000.times do
  array = ["sales","marketing","technical"]
  Request.create({ name:      Faker::Name.name,
                  email:      Faker::Internet.email,
                  department: array.sample,
                  message:    Faker::Company.bs
                  })
end

puts "generated 1000 questions"
