class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy

  def to_param
    self.name.parameterize
  end

  def current_cart
    if self.cart.nil?
      self.create_cart(user_id: self.id)
    end
    self.cart
  end

end
