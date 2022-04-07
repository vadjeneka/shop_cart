class CartItemsController < ApplicationController
  before_action :set_cart, only:[:create, :add_quantity, :reduce_quantity, :destroy]


def create
  # associer le produit et le panier courrant 
  chosen_product = Product.find(params[:product_id])
  current_cart = @current_cart

  if current_cart.products.include?(chosen_product)
    @cart_item = current_cart.cart_items.find_by(:product_id => chosen_product)
    @cart_item.quantity += 1
    
  else
    @cart_item = CartItem.new
    @cart_item.cart = current_cart
    @cart_item.product = chosen_product
    
  end
  lg = Log.create(description:"Product #{chosen_product.name} add")
  @cart_item.log = lg
  @cart_item.save
  # raise @cart_item.inspect
  redirect_to cart_path(current_cart)
end



def destroy
  @cart_item = CartItem.find(params[:id])
  lg = Log.create(description:"Product #{@cart_item.product.name} destroy")
  @cart_item.log = lg
  @cart_item.destroy
  redirect_to cart_path(@current_cart)
end  

def add_quantity
  @cart_item = CartItem.find(params[:id])
  @cart_item.quantity += 1
  lg = Log.create(description:"Product #{@cart_item.product.name} add quantity more 1")
  @cart_item.log = lg
  @cart_item.save
  # raise params[:id].inspect
  # redirect_to cart_path(params[:id])
  redirect_to cart_path(@current_cart)
end

def reduce_quantity
  @cart_item = CartItem.find(params[:id])
  if @cart_item.quantity > 1
    @cart_item.quantity -= 1
  end
  lg = Log.create(description:"Product #{@cart_item.product.name} reduce quantity of 1")
  @cart_item.log = lg
  @cart_item.save
  redirect_to cart_path(@current_cart)
end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity,:product_id, :cart_id)
  end
end
