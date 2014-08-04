# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { email: "noah@appacademy.io", password: "noahnoah" },
  { email: "saito@appacademy.io", password: "saitosaito" },
  { email: "tommy@appacademy.io", password: "tommytommy" },
  { email: "jonathan@appacademy.io", password: "jonathanjonathan" }
])

noah = User.first
saito = User.find_by_email("saito@appacademy.io")
tommy = User.find_by_email("tommy@appacademy.io")
jonathan = User.find_by_email("jonathan@appacademy.io")

circle = noah.owned_circles.create({ name: "Instructors" })

circle.friend_ids = [tommy.id, jonathan.id]


