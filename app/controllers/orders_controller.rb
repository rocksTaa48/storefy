class OrdersController < ApplicationController


  def checked
    @selected_order = Order.where(id: params[:order_ids]).destroy_all
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: {cart: @orders})
      end
    end
  end

end