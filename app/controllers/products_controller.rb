class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    @product = Product.create(product_params)
    if @product.save 
      redirect_to products_path, notice: 'Produit créé avec succès!'
    else
      flash[:error] = "Le produit ne peut être créé!"
      render new 
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to cart_path
  end

  private 
  def product_params 
    params.require(:product).permit(:code, :name, :price)
  end
end
