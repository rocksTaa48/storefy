class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  STATUSES = %w[in_cart in_purchase in_send in_arrived].freeze
  STATUSES.each do |s|
    define_method("#{s}?") { status == s }
    define_method("#{s}!") { update! status: s }
    scope s.to_sym, -> {where(status: s)}
  end

  validates :status, inclusion: { in: STATUSES }

  before_validation :set_initial_status, on: :create
  def set_initial_status
    self.status = "in_cart"
  end


  def total
    product.price * quantity
  end

end
