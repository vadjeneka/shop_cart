class Log < ApplicationRecord
  # belongs_to :product
  has_many :cart_items
end
