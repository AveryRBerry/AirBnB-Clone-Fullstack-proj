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

ActiveRecord::Schema[7.0].define(version: 2023_09_20_152531) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.bigint "host_id", null: false
    t.string "address", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.integer "num_beds", null: false
    t.integer "num_bedrooms", null: false
    t.integer "number_bathrooms", null: false
    t.float "price", null: false
    t.boolean "has_ac", null: false
    t.boolean "has_wifi", null: false
    t.boolean "has_pets_allowed", null: false
    t.boolean "has_washer_dryer", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_listings_on_host_id"
    t.index ["latitude"], name: "index_listings_on_latitude"
    t.index ["longitude"], name: "index_listings_on_longitude"
    t.index ["num_bedrooms"], name: "index_listings_on_num_bedrooms"
    t.index ["price"], name: "index_listings_on_price"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

  add_foreign_key "listings", "users", column: "host_id"
end
