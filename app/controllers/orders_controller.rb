class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    cart = @current_cart.id
    @order = Order.create(:cart_id => cart)
    @current_cart.cart_items.each do |item|
      @order.cart.cart_items << item
      item.cart_id = nil
    end
    @current_cart.update(is_validate: true)
    @current_cart.save
    # Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end

  
  private
    def order_params
      params.require(:order).permit(:cart_id)
    end
end
