# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_17_082820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "cover_image"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "is_subscribed", default: false
    t.index ["user_id"], name: "index_agencies_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "starting_point"
    t.string "end_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "distance"
    t.bigint "driver_id"
    t.bigint "user_id"
    t.float "source_latitude"
    t.float "source_longitude"
    t.float "destination_latitude"
    t.float "destination_longitude"
    t.index ["driver_id"], name: "index_bookings_on_driver_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact_1"
    t.string "contact_2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "address"
    t.string "id_proof"
    t.string "additional_id"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "agency_id"
    t.string "zipcode"
    t.float "latitude"
    t.float "longitude"
    t.string "additional_proof"
    t.index ["agency_id"], name: "index_drivers_on_agency_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_features", force: :cascade do |t|
    t.bigint "plan_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_plan_features_on_feature_id"
    t.index ["plan_id"], name: "index_plan_features_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "address"
    t.string "id_proof"
    t.string "role"
    t.string "provider"
    t.string "uid"
    t.string "stripe_customer_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agencies", "users"
  add_foreign_key "bookings", "drivers"
  add_foreign_key "bookings", "users"
  add_foreign_key "drivers", "agencies"
  add_foreign_key "plan_features", "features"
  add_foreign_key "plan_features", "plans"
end
