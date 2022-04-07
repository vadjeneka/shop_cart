class CreateCart 
  include Interactor

  def call 
    cart = Cart.create(context.cart_params)
    if cart.valid?
      context.cart = cart 
    else
      context.fail!(errors: cart.errors)
    end
  end
end