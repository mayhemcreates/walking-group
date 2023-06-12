require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."

puts "seeding database with walk dates"

Walk.destroy_all
User.destroy_all

10.times do
  User.create!(email: "simonjmayhew3@gmail.com", password: 'kentra123')
end

Walk.create!(day: '22-5-2023', location: '', leader: '')

def calculate_next_thursday(date)
  new_date = date + 6
  new_date.next_occurring(:thursday)
end

walk_dates = []

while walk_dates.length <= 20
  walk = Walk.create!(day: calculate_next_thursday(Walk.last.day), location: '', leader: '')
  walk_dates << walk
end

puts "#{walk_dates}"
