# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"



puts "--- Destroying current data user/lecture ---"
User.destroy_all
Lecture.destroy_all
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
file = URI.open('https://www.ideematic.com/wp-content/uploads/2018/05/ruby-on-rails.png')
lecture.photo.attach(io: file, filename: 'rails.png', content_type: 'image/png')


lecture1 = Lecture.create!(title: "Peinture à l'huile", description: "Je vous accompagne pour vos projets de peinture à l'huile. Toutes les techiques nécéssaires à l'implémentation de vos peintures", category: "Art", user: c)
file = URI.open('https://mi0.rightinthebox.com/images/x/201905/dveccr1557396967601.jpg')
lecture1.photo.attach(io: file, filename: 'paint-oil.jpg', content_type: 'image/jpg')


b = Block.create!(lecture_id: lecture.id, block_type: "Video", content: "Découvrez le monde de Rails grâce à mon tutoriel de deux heures. Apprenez à faire des seeds " )
b1 = Block.create!(lecture_id: lecture.id, block_type: "Podcast", content: "Je vous explique a travers ce podcast comment créer une app rails" )

b2 = Block.create!(lecture_id: lecture1.id, block_type: "Text", content: "Voici un cheatsheet pour savoir comment faire une belle peinture à l'huile" )
b3 = Block.create!(lecture_id: lecture1.id, block_type: "Video", content: "Une démonstration, comment faire des dragons avec de la peinture à l'huile" )


puts "-- lecture pour amélien--"

lecture8 = Lecture.create!(title: "Chants", description: "Je suis prêt à entrainer vos belles voix pour vos plus beaux concerts", category: "Art", user: a)
file = URI.open('https://p5.storage.canalblog.com/57/71/1380236/106139385.jpg')
lecture8.photo.attach(io: file, filename: 'sing.jpg', content_type: 'image/jpg')

lecture9 = Lecture.create!(title: "Cours d'anglais 101", description: "Accompagnement pour l'apprentissage d'anglais niveau débutant", category: "Langue", user: a)
file = URI.open('https://www.alternance-professionnelle.fr/wp-content/uploads/2019/03/cours-anglais-intensif-300x209.jpg')
lecture9.photo.attach(io: file, filename: 'english-class.jpg', content_type: 'image/jpg')


b4 = Block.create!(lecture_id: lecture8.id, block_type: "Text", content: "voyez une de mes création pour vous divertir et apprendre à écrire des chansons" )
b5 = Block.create!(lecture_id: lecture8.id, block_type: "Video", content: "Entrainez votre thorax avant de faire un concert" )

b6 = Block.create!(lecture_id: lecture9.id, block_type: "Video", content: "Tous sur les prononciations des UKs, mieux comprendre et avancer." )
b6 = Block.create!(lecture_id: lecture9.id, block_type: "Text", content: "Tous vos verbes irrégulier, facile à apprendre" )


puts "---seeds ending---"
