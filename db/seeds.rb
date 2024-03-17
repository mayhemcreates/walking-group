require 'date'
require 'dotenv/load'

puts "Cleaning database..."

puts "seeding database with walk dates"

Walk.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(User.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Walk.table_name)

seed_password = ENV['GROUP_PASSWORD']


User.create!(username:"walkers", password: seed_password)

Walk.create!(day: '15-6-2023', location: '', leader: '', visible: true, postcode: "", notes: "", contact: "")

puts "#{Walk.first}"

def calculate_next_thursday(date)
  new_date = date + 6
  new_date.next_occurring(:thursday)
end

walk_dates = []

while walk_dates.length <= 12
  walk = Walk.create!(day: calculate_next_thursday(Walk.last.day), location: '', leader: '', visible: true, postcode: "", notes: "", contact: "")
  walk_dates << walk
end

puts "#{walk_dates}"
