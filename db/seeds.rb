# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create!(name: 'Dejan', email: 'dejan@gmail.com', password: 'password')
user2 = User.create!(name: 'Adorn', email: 'adorn@gmail.com', password: 'password')
category1 = Category.create!(name: 'Food', icon: 'https://cdn-icons-png.flaticon.com/128/3075/3075977.png', user_id: user1.id )
category2 = Category.create!(name: 'Grossery', icon: 'https://cdn-icons.flaticon.com/png/128/3514/premium/3514242.png?token=exp=1653215344~hmac=84e0193008cde39766ceb9fc17d45a37', user_id: user1.id )
category3 = Category.create!(name: 'Energy', icon: 'https://cdn-icons-png.flaticon.com/128/2731/2731636.png', user_id: user1.id )
payment1 = Payment.create!(name: 'bananas', amount: 25, category: category1)
payment2 = Payment.create!(name: 'milk', amount: 30, category: category1)
payment3 = Payment.create!(name: 'yogurt', amount: 36, category: category1)
payment4 = Payment.create!(name: 'ananas', amount: 25, category: category2)
payment5 = Payment.create!(name: 'apples', amount: 30, category: category2)
payment6 = Payment.create!(name: 'honey', amount: 36, category: category2)

puts 'Seed data created successfully'
