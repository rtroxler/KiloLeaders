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
      User.create!(name: name, email: email, password: password, password_confirmation: password)
    end
    users = User.all(limit: 6)
    users.each do |user|
      pr_total = rand(150..330)
      5.times do |i|
        total = pr_total * (100 - i) / 100.00
        user.lifts.create!(name: "snatch", weight: (total * 0.45))
        user.lifts.create!(name: "cnj", weight: (total * 0.55))
      end
    end
  end
end
