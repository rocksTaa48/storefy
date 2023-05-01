class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :products, through: :orders
  has_many :reviews
  has_many :products

  STATUSES = %w[default seller admin].freeze
  STATUSES.each do |s|
    define_method("#{s}?") { status == s }
    define_method("#{s}!") { update! status: s }
    scope s.to_sym, -> {where(status: s)}
  end

  before_validation :set_initial_status, on: :create
  def set_initial_status
    self.status = "default"
  end

end
