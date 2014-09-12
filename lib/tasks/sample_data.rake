namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Ryan Troxler",
                 email: "troxler.ryan@gmail.com",
                 password: "password",
                 password_confirmation: "password",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    50.times do
      name = ["snatch", "cnj"].sample
      weight = rand(90..150)
      users.each {|user| user.lifts.create!(name: name, weight: weight) }
    end
  end
end
