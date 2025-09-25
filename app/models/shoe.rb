class Shoe < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :orders, through: :order_items
end
