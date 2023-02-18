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

ActiveRecord::Schema[7.0].define(version: 2023_02_18_213240) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", limit: 50
    t.string "password", limit: 50
    t.string "full_name", limit: 100
    t.text "billing_address"
    t.text "default_shipping_address"
    t.string "country", limit: 50
    t.string "phone", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "option_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options_products", id: false, force: :cascade do |t|
    t.bigint "option_id", null: false
    t.bigint "product_id", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.decimal "price"
    t.string "sku"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.decimal "amount"
    t.text "shipping_address"
    t.text "order_address"
    t.string "order_email"
    t.string "order_state"
    t.date "order_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.text "description"
    t.string "image"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
