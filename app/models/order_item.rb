class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :shoe
  belongs_to :service
end
