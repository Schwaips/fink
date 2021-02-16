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
  c = User.create!(first_name: "Charlie", last_name: "Bertrand", email: "charlie.bertrand@live.com", password: "123456", role: "teacher", slack_workspace_uid:"D01MLG5H9M5")
  cb = URI.open('https://media-exp1.licdn.com/dms/image/C5603AQFbywQG0KAjeQ/profile-displayphoto-shrink_800_800/0/1539070374037?e=1619049600&v=beta&t=sV2smVTKLvzWhXZpAi5Oj84xwLYQ3SJ29_qpcA1O6lA')
  c.photo.attach(io: cb, filename: 'charlie-avatar.jpg', content_type: 'image/jpg')

  a = User.create!(first_name: "Amelien", last_name: "Delahaie", email: "amelien.delahaie@live.com", password: "123456", role: "teacher")
  am = URI.open('https://pbs.twimg.com/profile_images/1177317334849130496/3-AonVB8_400x400.jpg')
  a.photo.attach(io: am, filename: 'amelien-avatar.jpg', content_type: 'image/jpg')

puts "--Charlie & Amélien teacher created--"

puts "-- creating students--"
  o = User.create!(first_name: "Olivia", last_name: "Bihl", email: "olivia.bihl@live.com", password: "123456", role: "student")
  ob = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQGQMlEDoj0jwA/profile-displayphoto-shrink_800_800/0/1524840699999?e=1619049600&v=beta&t=e_GlYITjGLOTB5KsbhekUHimPjJBHBL8mJWtuc1qnj0')
  o.photo.attach(io: ob, filename: "olivia-avatar", content_type: "image/jpg")

  r = User.create!(first_name: "Raphael", last_name: "Mosca", email: "raphael.mosca@live.com", password: "123456", role: "student")
  rm = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQFyEtL7SCBiEQ/profile-displayphoto-shrink_800_800/0/1595506575911?e=1619049600&v=beta&t=pZRj6JLzijvGfXt3C3heMG04LuUyfiXgYsAthqPZvJI')
  r.photo.attach(io: rm, filename: "raph-avatar.jpg", content_type: "image/jpg")
puts "--student created--"

# lecture creation

puts "-- lecture pour charlie--"
lecture = Lecture.create!(title: "Developpement Web Ruby", description: "Apprenez à developper sur Ruby on Rails en moins de 6 mois. Je vous fournis tout plein de video de cours. En parralèle, je peux faire des 1to1 sur demandes", category: "Developpement", user: c)
file = URI.open('https://www.ideematic.com/wp-content/uploads/2018/05/ruby-on-rails.png')
lecture.photo.attach(io: file, filename: 'rails.png', content_type: 'image/png')

  b = Block.create!(lecture_id: lecture.id, title:"Introduction à rails", block_type: "Video", content: "Découvrez le monde de Rails grâce à mon tutoriel de deux heures. Apprenez à faire des seeds " )
  b1 = Block.create!(lecture_id: lecture.id, block_type: "Podcast", title:"Utilisation des controllers", content: "Je vous explique a travers ce podcast comment créer une app rails" )


lecture1 = Lecture.create!(title: "Peinture à l'huile", description: "Je vous accompagne pour vos projets de peinture à l'huile. Toutes les techiques nécéssaires à l'implémentation de vos peintures", category: "Art", user: c)
file = URI.open('https://mi0.rightinthebox.com/images/x/201905/dveccr1557396967601.jpg')
lecture1.photo.attach(io: file, filename: 'paint-oil.jpg', content_type: 'image/jpg')

  b2 = Block.create!(lecture_id: lecture1.id, block_type: "Text", title:"Tricks pour peinture", content: "Voici un cheatsheet pour savoir comment faire une belle peinture à l'huile" )
  b3 = Block.create!(lecture_id: lecture1.id, block_type: "Video", title:"Dragons en peinture", content: "Une démonstration, comment faire des dragons avec de la peinture à l'huile" )

artcomt = Lecture.create!(title: "Histoire de l'Art comtemporain", description: "Toutes les racines de l'art comtemporain", category: "Art", user: c)
file = URI.open('https://www.guide-artistique.com/images/header/art-contemporain.jpg')
artcomt.photo.attach(io: file, filename: 'art-comtem.jpg', content_type: 'image/jpg')

  bartcomt1 = Block.create!(lecture_id: artcomt.id, block_type: "Video", title:"Introduction", content: "Quels sont les impacts de l'art comtenporain sur notre société actuelle?" )
  bartcomp2 = Block.create!(lecture_id: artcomt.id, block_type: "Video", title:"Les grands acteurs du XXeme siecle", content: "Un plongeon au coeur des grands noms de l'art qui ont faconnés notre mode de vie" )

artegy = Lecture.create!(title: "L'Egypte antique et l'art", description: "Les egyptiens a l'époque des pharaons et leurs approches vis à vis de l'art", category: "Art", user: c)
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/%C3%84gyptischer_Maler_um_1360_v._Chr._001.jpg/384px-%C3%84gyptischer_Maler_um_1360_v._Chr._001.jpg')
artegy.photo.attach(io: file, filename: 'art-comtem.jpg', content_type: 'image/jpg')

  bartegy = Block.create!(lecture_id: artegy.id, block_type: "Video", title:"Des pharaons à aujourd'hui", content: "Les pyramides, le Sphinx, les pharaons...l'art d'aimer l'art" )
  bartegy2 = Block.create!(lecture_id: artegy.id, block_type: "Video", title:"De l'or et des esclaves", content: "L'art, raconté en histoire par les égyptiens antiques" )


lecture13 = Lecture.create!(title: "Cours d'espagnol", description: "Apprenez l'espagnol, et envolez vous pour Barcelone", category: "Langue", user: c)
file = URI.open('https://www.managementdelaformation.fr/wp-content/uploads/2018/05/RHEXIS_Actu_Espagne.jpg')
lecture13.photo.attach(io: file, filename: 'spanish-class.jpg', content_type: 'image/jpg')

lecture14 = Lecture.create!(title: "Cours d'italien", description: "Venez apprendre l'italien avec Charlie le polyglotte", category: "Langue", user: c)
file = URI.open('https://www.airtransat.com/getmedia/06aeacd6-0120-454c-906b-d324b859577a/italie-cinque-terre-italy-2050x1200.aspx?width=2050&height=1200&ext=.jpg')
lecture14.photo.attach(io: file, filename: 'italian-class.jpg', content_type: 'image/jpg')

lecture15 = Lecture.create!(title: "Cours de français", description: "Parlez français avec Charlie", category: "Langue", user: c)
file = URI.open('https://www.touteleurope.eu/fileadmin/user_upload/France.png')
lecture15.photo.attach(io: file, filename: 'french-class.jpg', content_type: 'image/jpg')


puts "-- lecture pour amélien--"

lecture8 = Lecture.create!(title: "Chants", description: "Je suis prêt à entrainer vos belles voix pour vos plus beaux concerts", category: "Art", user: a)
file = URI.open('https://p5.storage.canalblog.com/57/71/1380236/106139385.jpg')
lecture8.photo.attach(io: file, filename: 'sing.jpg', content_type: 'image/jpg')

  b4 = Block.create!(lecture_id: lecture8.id, block_type: "Text", title:"Mes créations", content: "voyez une de mes création pour vous divertir et apprendre à écrire des chansons" )
  b5 = Block.create!(lecture_id: lecture8.id, block_type: "Video", title:"Echauffement, les bases", content: "Entrainez votre thorax avant de faire un concert" )


lecture9 = Lecture.create!(title: "Cours d'anglais 101", description: "Accompagnement pour l'apprentissage d'anglais niveau débutant", category: "Langue", user: a)
file = URI.open('https://www.alternance-professionnelle.fr/wp-content/uploads/2019/03/cours-anglais-intensif-300x209.jpg')
lecture9.photo.attach(io: file, filename: 'english-class.jpg', content_type: 'image/jpg')

  b6 = Block.create!(lecture_id: lecture9.id, block_type: "Video", title:"Les prononciations", content: "Tous sur les prononciations des UKs, mieux comprendre et avancer." )
  b6 = Block.create!(lecture_id: lecture9.id, block_type: "Text", title:"Verbes irréguliers", content: "Tous vos verbes irrégulier, facile à apprendre" )

lecture10 = Lecture.create!(title: "Python", description: "Venez découvrir Python", category: "Developpement", user: a)
file = URI.open('https://www.lobservateurdebeauvais.fr/wp-content/uploads/2020/09/python.jpg')
lecture10.photo.attach(io: file, filename: 'sing.jpg', content_type: 'image/jpg')

lecture11 = Lecture.create!(title: "Javascript", description: "Venez découvrir Javascript", category: "Developpement", user: a)
file = URI.open('https://www.developpez.net/forums/attachments/p513560d1/a/a/a')
lecture11.photo.attach(io: file, filename: 'sing.jpg', content_type: 'image/jpg')

lecture12 = Lecture.create!(title: "SQL", description: "Venez découvrir SQL", category: "Developpement", user: a)
file = URI.open('https://www.softfluent.fr/wp-content/uploads/2019/10/SQL.png')
lecture12.photo.attach(io: file, filename: 'sing.jpg', content_type: 'image/jpg')

puts "---seeds ending---"
