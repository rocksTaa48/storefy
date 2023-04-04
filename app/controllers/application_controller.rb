class ApplicationController < ActionController::Base

  include Pagy::Backend

  before_action :set_render_cart

  def set_render_cart
    @render_cart = true
  end

  def current_cart
    if  current_user.present?
      current_user.current_cart
    else
      Cart.find(session[:cart_id])
    end
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
  end

end
