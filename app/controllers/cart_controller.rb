class CartController < ApplicationController

  def show
    @orders = current_user.orders.in_cart
  end

  def add
    @orders = current_user.orders.in_cart
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_order = @orders.find_by(product_id: @product.id)
    if current_order && quantity > 0
      current_order.update(quantity:)
    elsif quantity <= 0
      current_order.destroy
    else
      @orders.create(product: @product, quantity:)
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'cart/cart',
                                                   locals: {cart: @orders}),
                              turbo_stream.replace(@product)]
      end
    end
  end

  def remove
    Order.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @orders })
      end
    end
  end



end