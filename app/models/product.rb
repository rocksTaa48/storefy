class Product < ApplicationRecord
  belongs_to :subcategory
  has_many :orders
  has_many :carts, through: :orders
end
