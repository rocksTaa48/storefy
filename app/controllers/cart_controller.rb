class CartController < ApplicationController


  def show
    @product = Product.find_by(id: params[:id])
    @orders = Order.find_by(id: params[:id])
    @render_cart = false
    redirect_to root_path unless current_user.name.parameterize == params[:user_id]
  end

  # add item to cart -->
  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    @cart = current_cart
    current_order = @cart.orders.find_by(product_id: @product.id)
    if current_order && quantity > 0
      current_order.update(quantity:)
    elsif quantity <= 0
      current_order.destroy
    else
      @cart.orders.create(product: @product, quantity:)
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'cart/cart',
                                                   locals: {cart: @cart}),
                                                   turbo_stream.replace(@product)]
      end
    end
  end
  # remove item -->
  def remove
    Order.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @cart })
      end
    end
  end


end