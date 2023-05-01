class Product < ApplicationRecord
  belongs_to :subcategory
  has_many :orders
  has_many :reviews
  belongs_to :user
end
