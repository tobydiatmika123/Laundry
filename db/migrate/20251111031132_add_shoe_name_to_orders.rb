class AddShoeNameToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :shoe_name, :string
  end
end
