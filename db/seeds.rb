# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

grocery = List.create(title: "grocery", category: "Personal")
programming = List.create(title: "programming", category: "Professional")
gifts = List.create(title: "gifts", category: "Personal")

sister = Item.create(list: gifts, name: "sister", notes: "", date: "2021-10-25 08:38:00", completed: true)
brother = Item.create(list: gifts, name: "brother", notes: "", date: "2021-10-27 08:38:00", completed: true)
aunt = Item.create(list: gifts, name: "aunt", notes: "", date: "2021-10-24 08:38:00", completed: false)
uncle = Item.create(list: gifts, name: "uncle", notes: "", date: "2021-10-25 08:38:00", completed: false)


