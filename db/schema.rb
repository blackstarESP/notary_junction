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

ActiveRecord::Schema.define(version: 2018_09_10_190456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "specializations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "home_phone"
    t.string "work_phone"
    t.string "mobile_phone"
    t.string "website_url"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "system_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["system_id"], name: "index_users_on_system_id", unique: true
    t.index ["zip_code"], name: "index_users_on_zip_code"
  end

  create_table "users_specializations", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "specialization_id"
    t.index ["specialization_id"], name: "index_users_specializations_on_specialization_id"
    t.index ["user_id"], name: "index_users_specializations_on_user_id"
  end

end
