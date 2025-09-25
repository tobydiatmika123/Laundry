# app/models/laundry_order.rb
class LaundryOrder < ApplicationRecord
  belongs_to :customer
  belongs_to :shoe
  belongs_to :service
end
