# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "--- Destroying current data ---"
User.destroy_all
puts "--starting seedings"
# user creation
# creating teacher example
puts "--creating teachers--"
  c = User.create!(first_name: "Charlie", last_name: "Bertrand", email: "charlie.bertrand@live.com", password: "123456", role: "teacher")
  a = User.create!(first_name: "Amelien", last_name: "Delahaie", email: "amelien.delahaie@live.com", password: "123456", role: "teacher")
puts "--Charlie & Amélien teacher created--"

puts "-- creating students--"
  o = User.create!(first_name: "Olivia", last_name: "Bihl", email: "olivia.bihl@live.com", password: "123456", role: "student")
  r = User.create!(first_name: "Raphael", last_name: "Mosca", email: "raphael.mosca@live.com", password: "123456", role: "student")
puts "--student created--"

puts "---seeds ending---"
