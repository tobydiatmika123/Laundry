class CreateLaundryOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :laundry_orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :status
      t.integer :total_price

      t.timestamps
    end
  end
end
