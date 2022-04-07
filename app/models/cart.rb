class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, :through => :cart_items
  has_many :logs
  has_one :order

  def sub_total
    sum = 0
    self.cart_items.each do |cart_item|
      sum+= cart_item.total_price
    end
    return sum
  end



end
