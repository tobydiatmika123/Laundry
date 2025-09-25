class CreateShoes < ActiveRecord::Migration[8.0]
  def change
    create_table :shoes do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :brand
      t.string :color
      t.string :size
      t.string :material
      t.string :condition

      t.timestamps
    end
  end
end
