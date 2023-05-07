class Product < ApplicationRecord

  belongs_to :user
  belongs_to :subcategory
  has_many :orders
  has_many :reviews

  validate :content_validation

  after_save :touch_object

  private

  def content_validation
    errors.add( :base, "Field cannot be blank") if title.blank? || body.blank? || price.blank? || quantity.blank?
  end

  def touch_object
    user.touch
  end

end
