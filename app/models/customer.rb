# app/models/customer.rb
class Customer < ApplicationRecord
  has_many :laundry_orders
end

# app/models/laundry_order.rb
class LaundryOrder < ApplicationRecord
  belongs_to :customer
  belongs_to :shoe
  belongs_to :service
end

# app/models/shoe.rb
class Shoe < ApplicationRecord
  has_many :laundry_orders
end

# app/models/service.rb
class Service < ApplicationRecord
  has_many :laundry_orders
end
