class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :shoe, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :status, default: "Pending"
      t.decimal :total_price, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
