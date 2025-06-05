# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

puts "Nettoyage des données..."
ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = OFF")
User.delete_all
City.delete_all
ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = ON")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cities'")

users = []
cities =[]
gossips = []

puts "Ajout des villes..."
10.times do
  cities.push City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

puts "Ajout des utilisateurs.."
10.times do
  users.push User.create!(
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name,
  email: Faker::Internet.unique.email,
  description: Faker::Lorem.paragraph(sentence_count: 2),
  age: rand(18..65),
  city_id: cities.sample.id
  )
end

puts "Ajout des gossips..."
20.times do
  gossips.push Gossip.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: users.sample.id
  )
end
