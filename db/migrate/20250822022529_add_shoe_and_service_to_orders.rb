class AddShoeAndServiceToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :shoe, foreign_key: true
    add_reference :orders, :service, foreign_key: true
  end
end
