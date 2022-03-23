# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user1 = User.create!(username: "Matthieu", address: "danstoncul", email: "test@gmail.com", password: "1213456")
Ski.destroy_all

ski1 = Ski.create!(brand: "Rossignol", category:"alpin", sizing:"180", description: "Superbes !", price: 34, user: user1)
ski2 = Ski.create!(brand: "Salomon", category:"alpin", sizing:"134", description: "Magiques !", price: 289, user: user1)
