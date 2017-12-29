# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times do |n|
#   User.create!(name: Faker::Vehicle.vin,
#                email: Faker::Internet.email,
#                password: "199392199392",
#               )
# end
#
# 10.times do |note|
#   Question.create!( title: Faker::Vehicle.vin,
#                     content: Faker::Vehicle.manufacture,
#                     user_id: User.last.id,
#                     )
# end

require "csv"

CSV.read('/stackoverflow_tags.csv').each do |row|
  ActsAsTaggableOn::Tag.create(:name => row[0], :description => row[1])
end
