# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: Faker::Vehicle.vin,
             email: Faker::Internet.email,
             password: "199392199392"
            )

10.times do |note|
  Question.create!( title: Faker::Vehicle.vin,
                    content: Faker::Vehicle.manufacture,
                    user_id: User.last.id,
                    )
end
