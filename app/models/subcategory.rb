class Subcategory < ApplicationRecord

  def to_param
    self.title
  end

  belongs_to :category
  has_many :products
end
