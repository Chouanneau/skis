require "nokogiri"
require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# idee de scraping pour les skis

Ski.destroy_all
User.destroy_all

# user1 = User.create!(username: "Matthieu", address: "danstoncul", email: "test@gmail.com", password: "1213456")
# ski1 = Ski.create!(brand: "Rossignol", category:"alpin", sizing:"180", description: "Superbes !", price: 34, user: user1)
# ski2 = Ski.create!(brand: "Salomon", category:"alpin", sizing:"134", description: "Magiques !", price: 289, user: user1)
# file = "skis.html"
# idee de scraping pour les skis

file = "skis.html"
doc = Nokogiri::HTML(File.open(file), nil, "utf-8")
user1 = User.create!(username: "brice", email: "brice@gmail.com", password: "123456", address: "Chemin de la Pommeraie 15, 1008 Prilly")
user2 = User.create!(username: "matthieu", email: "matthieu@gmail.com", password: "123456", address: "Route de la Pale 8, 1026 Denges")
user3 = User.create!(username: "david", email: "david@gmail.com", password: "123456", address: "Chemin des Sablons 13, 1007 Lausanne")
user4 = User.create!(username: "alex", email: "alex@gmail.com", password: "123456", address: "Avenue du Temple 61, 1012 Lausanne")
user5 = User.create!(username: "cataline", email: "cataline@gmail.com", password: "123456", address: "Chemin de Montagny 55, 1091 Villette")
user6 = User.create!(username: "momo", email: "momo@gmail.com", password: "123456", address: "Chemin de Vuichardaz 11, 1030 Bussigny")
user7 = User.create!(username: "quentin", email: "quentin@gmail.com", password: "123456", address: "Chemin des Crêts 17, 1209 Genève")
user8 = User.create!(username: "antoine", email: "antoine@gmail.com", password: "123456", address: "Rue du Jura 1-3, 1201 Genève")
# # # user2 = User.create!(username: "2", email: "2@gmail.com", password: "123456", address: "Chemin des Joncquilles, Renens")
# # user5 = User.create!(username: "5", email: "5@gmail.com", password: "123456", address: "Chemin des Joncquilles, Renens")

categories = ["Ski Alpin", "Ski de Rando"]

doc.search('.df-card').each do |element|
  title = element.search('.df-card__title').text.strip
  brand = element.search('.df-card__brand').text.strip
  description = element.search('.df-card__description').text.strip
  sizing = element.search('.d-inline-block').first.text.strip
  price = element.search('.df-card__price').text.strip
  category = "Ski Alpin"
  p photo_url = element.search('.df-card__image img').attribute('src').value
  photo_file = URI.open("https:" + photo_url)

  ski = Ski.new(
    title: title,
    brand: brand,
    description: description,
    sizing: sizing,
    price: price,
    category: categories.sample,
    user: User.all.sample,
    availability: true
  )
  ski.photo.attach(io: photo_file, filename: "#{title}.jpg", content_type: 'image/jpg')
  # article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  ski.save!
end
