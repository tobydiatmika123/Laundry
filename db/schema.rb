# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_11_11_031132) do
  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laundry_orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "service_id", null: false
    t.string "status"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_laundry_orders_on_customer_id"
    t.index ["service_id"], name: "index_laundry_orders_on_service_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "shoe_id", null: false
    t.integer "service_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["service_id"], name: "index_order_items_on_service_id"
    t.index ["shoe_id"], name: "index_order_items_on_shoe_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.datetime "order_date"
    t.string "status"
    t.decimal "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shoe_id"
    t.integer "service_id"
    t.string "shoe_name"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["service_id"], name: "index_orders_on_service_id"
    t.index ["shoe_id"], name: "index_orders_on_shoe_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id", null: false
    t.datetime "payment_date"
    t.decimal "amount"
    t.string "method"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoes", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "brand"
    t.string "color"
    t.string "size"
    t.string "material"
    t.string "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_shoes_on_customer_id"
  end

  add_foreign_key "laundry_orders", "customers"
  add_foreign_key "laundry_orders", "services"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "services"
  add_foreign_key "order_items", "shoes"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "services"
  add_foreign_key "orders", "shoes"
  add_foreign_key "payments", "orders"
  add_foreign_key "shoes", "customers"
end
