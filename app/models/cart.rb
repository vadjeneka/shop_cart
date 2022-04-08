class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, :through => :cart_items
  has_many :logs
  has_one :order
  # validates :is_validate, presence: true
  #Ex:- :default =>'',presence: true

  def sub_total
    sum_price = 0
    self.cart_items.each do |cart_item|
      sum_price+= cart_item.total_price
    end
    return sum_price
  end



end
