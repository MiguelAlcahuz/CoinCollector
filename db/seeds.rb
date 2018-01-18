# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new()
user1.email = "mikealcahuz@gmail.com"
user1.password = "12341234"
user1.username = "HKD"
user1.save

user2 = User.new()
user2.email = "miguelalcahuz@gmail.com"
user2.password = "12341234"
user2.username = "HKD1"
user2.save

collection1 = Collection.new()
collection1.currency = "Euros"
collection1.user_id = "1"
collection1.save

collection2 = Collection.new()
collection2.currency = "Euros1"
collection2.user_id = "2"
collection2.save

coin1 = Coin.new()
coin1.year = 2015
coin1.value = 0.01
coin1.country = 0
coin1.collection_id = 1
coin1.save

