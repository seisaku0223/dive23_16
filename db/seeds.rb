# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |n|
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: "199392199392",
              )
end

60.times do |note|
  user_id =  rand(2..20)
  Question.create!( title: Faker::Vehicle.vin,
                    content: Faker::Vehicle.manufacture,
                    user_id: user_id,
                  )
end

1.times do |o|
  user_id =  1
  44.times do |m|
  question_id = o + m + 1
  Question.create!( title: Faker::Vehicle.vin,
                    content: Faker::Vehicle.manufacture,
                    user_id: user_id,
                  )
  Favorite.create!( user_id: user_id,
                    question_id: question_id,
                  )
  Vote.create!( user_id: user_id,
                question_id: question_id,
              )
  Answer.create!( user_id: user_id,
                  question_id: question_id,
                  content: Faker::Lorem.sentence,
                  )
  end
end

10.times do |h|
  user_id =  h + 2
  10.times do |i|
  question_id = h + i + 1
  Favorite.create!( user_id: user_id,
                    question_id: question_id,
                  )
  Vote.create!( user_id: user_id,
                question_id: question_id,
              )
  Answer.create!( user_id: user_id,
                  question_id: question_id,
                  content: Faker::Lorem.sentence,
                  )
  end
end


##stackoverflow_tags.csvをdbにインポート
# require "csv"
#
# CSV.read('/stackoverflow_tags.csv').each do |row|
#   ActsAsTaggableOn::Tag.create(:name => row[0], :description => row[1])
# end
