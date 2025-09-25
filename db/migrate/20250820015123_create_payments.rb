class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.datetime :payment_date
      t.decimal :amount
      t.string :method
      t.string :status

      t.timestamps
    end
  end
end
