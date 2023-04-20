require 'pg'
require 'faker'

(1..10).each do |id|
  User.create!(
    id: id,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "qwerty",
    password_confirmation: "qwerty",
    phone: Faker::PhoneNumber.cell_phone
    )
end

(1..10).each do |id|
  Category.create!(
    id: id,
    title: Faker::Commerce.department
    )
end

(1..30).each do |id|
  Subcategory.create!(
    id: id,
    title: Faker::Commerce.brand,
    body: Faker::Lorem.sentence(word_count: 5),
    category_id: Category.find(rand(1..10)).id,
    )
end

(1..100).each do |id|
  Product.create!(
    id: id,
    body: Faker::Lorem.sentence(word_count: 30),
    title: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 35..400),
    quantity: Faker::Commerce.price(range: 2..100),
    subcategory_id: Subcategory.find(rand(1..30)).id,
    )
end