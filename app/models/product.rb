class Product < ApplicationRecord
  # has_many :carts, :through => :cart_items
  has_many :cart_items, dependent: :destroy
  has_many :logs
  validates_presence_of :code
  validates_presence_of :name
  validates_presence_of :price, presence:true

end
