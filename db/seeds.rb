# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = '1111'
# user['password_confirmation'] = '1111'

ActiveRecord::Base.transaction do
  5.times do

    user['email'] = Faker::Internet.email


    User.create(user)
  end
end




# Seed Venue
venue = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  30.times do
    venue['name'] = Faker::App.name
    venue['description'] = Faker::Hipster.sentence
    venue['user_id'] = rand(1..7)
    venue['category'] = ["Noodles", "Thai", "Chinese", "Rice", "Dessert", "Drinks"].sample
    venue['price'] = ["$", "$$", "$$$", "$$$$",].sample
    venue['longitude'] = rand(100.00..101.00)
    venue['latitude'] = rand(13.50..14.01)
    venue['phone'] = Faker::PhoneNumber.cell_phone
    venue['contact'] = Faker::Internet.email



    Venue.create(venue)
  end
end


40.times do
  v = Vote.create(user_id: rand(1..7), venue_id: rand(1..30), rating: rand(1..5), review: ["Tastes great. Will be back!" , "Was OK. Nothing special.", "Very crowded and noisey. People were nice.", "Great food and great people."].sample)
  venue = Venue.find(v.venue_id)
  new_avg = venue.votes.average(:rating).round
  venue.update(avg_rating: new_avg)
end
