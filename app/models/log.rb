class Log < ApplicationRecord
  validates :description, presence: true
  has_many :cart_items
end
