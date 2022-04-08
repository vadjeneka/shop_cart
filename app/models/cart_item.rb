class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :log


  def total_price
    if self.product.name == "Green" && self.quantity % 2 != 0
      q = self.quantity
      r = self.quantity % 2 
      p_price = self.product.price
      total_price = (r * p_price) + ( (q - r) / 2 ) * p_price

    elsif self.product.name == "Green" && self.quantity % 2 == 0
      total_price = (self.quantity/2) * self.product.price

    elsif self.product.name == "Strawberries" && self.quantity >= 3
      p_price = self.product.price
      p_price = 4.5
      total_price = self.quantity * p_price
      
    elsif self.product.name == "Coffe" && self.quantity >= 3 
      p_price = self.product.price * 2/3
      total_price = self.quantity * p_price

    else total_price = self.quantity * self.product.price
    end
    total_price
  end
end

