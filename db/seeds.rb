# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Lucas", email: "test1@test.com", password: "test", location: "Taylor, PA")
User.create(name: "Gabriel", email: "test2@test.com", password: "test", location: "Taylor, PA")
User.create(name: "Scarlett", email: "test3@test.com", password: "test", location: "Taylor, PA")
User.create(name: "Lucky", email: "test4@test.com", password: "test", location: "Scranton, PA")
User.create(name: "Sunny", email: "test5@test.com", password: "test", location: "Dunmore, PA")
User.create(name: "Tanner", email: "test6@test.com", password: "test", location: "Clarks Summit, PA")

