class Product < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_many :orders
  has_many :reviews

  validate :content_validation

  private

  def content_validation
    if title.blank? && body.blank? && price.blank?
      errors.add :error, "Fields can't be null"
    end
  end
end
