namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Ryan Troxler",
                 email: "troxler.ryan@gmail.com",
                 password: "password",
                 password_confirmation: "password",
                 admin: true)
    49.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name, email: email, password: password, password_confirmation: password)
    end
    User.all.each do |user|
      5.times do |i|
        squat = rand(150..280)
        snatch_efficiency = rand(55..65)
        cnj_efficiency = rand(70..80)
        user.lifts.create!(name: "snatch", weight: squat * (snatch_efficiency / 100.0))
        user.lifts.create!(name: "clean_and_jerk", weight: squat * (cnj_efficiency / 100.0))
        user.lifts.create!(name: "squat", weight: squat)
      end
    end
  end
end
