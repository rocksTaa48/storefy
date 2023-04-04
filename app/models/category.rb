class Category < ApplicationRecord

  def to_param
    self.title
  end

  has_many :subcategories
  has_many :products, through: :subcategories
end
