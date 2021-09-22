# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Holly", email: "holly@holly.com", password: "holly", admin:true)
10.times do |index|
   Resolution.create!(
         title: Faker::Lorem.words,
         details: Faker::Lorem.sentence,
         end_date: '2020-11-06',
         user_id: User.all.pluck(:id).sample,
     )
end
# 10.times do |index|
#    Task.create!(
#          task_title: Faker::Lorem.words,
#          task_details: Faker::Lorem.sentence,
#          frequency: 'Daily',
#          resolution_id: Resolution.all.pluck(:id).sample,
#      )
# end
10.times do |n|
  name = Faker::Games::Pokemon.name
  nickname = "nickname"
  email = Faker::Internet.email

  password = "password"
  User.create!(name: name,
                nickname: nickname,
               email: email,
               password: password,
               )
             end
