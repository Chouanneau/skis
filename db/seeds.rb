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

# Ski.destroy_all

file = "skis.html"
doc = Nokogiri::HTML(File.open(file), nil, "utf-8")
user = User.create!(username: "demo", email: "demo@gmail.com", password: "123456", address: "Chemin des Joncquilles, Renens")


# # # user2 = User.create!(username: "2", email: "2@gmail.com", password: "123456", address: "Chemin des Joncquilles, Renens")
# # user5 = User.create!(username: "5", email: "5@gmail.com", password: "123456", address: "Chemin des Joncquilles, Renens")


doc.search('.df-card').each do |element|
  title = element.search('.df-card__title').text.strip
  brand = element.search('.df-card__brand').text.strip
  description = element.search('.df-card__description').text.strip
  sizing = element.search('.d-inline-block').text.strip
  price = element.search('.df-card__price').text.strip
  category = "Ski Aplin"
  # photo_url = element.search('.df-card__image').text.strip
  # price = ...
  # photo_url = ...
  # photo_file = URI.open(photo_url)

  ski = Ski.new(title: title, brand: brand, description: description, sizing: sizing, price: price, category: category, user: user)
  # ski.attach.photo(io: photo_file)
  ski.save!
end
