FactoryBot.define do

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "qwerty" }
    phone { Faker::PhoneNumber.cell_phone }
  end

  factory :category do
    title { Faker::Commerce.department }
  end

  factory :subcategory do
    title { Faker::Commerce.brand }
    body { Faker::Lorem.sentence(word_count: 5) }
    category { Category.first }
  end

  factory :product do
    title { Faker::Commerce.product_name }
    body { Faker::Lorem.sentence(word_count: 30) }
    price { Faker::Commerce.price(range: 75..850) }
    quantity { Faker::Commerce.price(range: 2..100) }
    subcategory
    user
  end

end