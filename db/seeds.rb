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

ActiveRecord::Base.connection.reset_pk_sequence!(User.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Walk.table_name)


User.create!(username:"walkers", password: 'ashford')

Walk.create!(day: '15-6-2023', location: '', leader: '', visible: true)

puts "#{Walk.first}"

def calculate_next_thursday(date)
  new_date = date + 6
  new_date.next_occurring(:thursday)
end

walk_dates = []

while walk_dates.length <= 12
  walk = Walk.create!(day: calculate_next_thursday(Walk.last.day), location: '', leader: '', visible: true)
  walk_dates << walk
end

puts "#{walk_dates}"
