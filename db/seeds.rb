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

# lecture creation

puts "-- lecture pour charlie--"
lecture = Lecture.create!(title: "Developpement Web Ruby", description: "Apprenez à developper sur Ruby on Rails en moins de 6 mois. Je vous fournis tout plein de video de cours. En parralèle, je peux faire des 1to1 sur demandes", category: "Developpement", user: c)
lecture1 = Lecture.create!(title: "Peinture à l'huile", description: "Je vous accompagne pour vos projets de peinture à l'huile. Toutes les techiques nécéssaires à l'implémentation de vos peintures", category: "Art", user: c)
puts "-- lecture pour amélien--"

lecture1 = Lecture.create!(title: "Chants", description: "Je suis prêt à entrainer vos belles voix pour vos plus beaux concerts", category: "Art", user: a)
lecture2 = Lecture.create!(title: "Cours d'anglais 101", description: "Accompagnement pour l'apprentissage d'anglais niveau débutant", category: "Langue", user: a)

puts "---seeds ending---"
