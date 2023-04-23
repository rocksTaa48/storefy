class Product < ApplicationRecord
  belongs_to :subcategory
  belongs_to :store
  has_many :orders
  has_many :reviews
end
