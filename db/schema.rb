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

ActiveRecord::Schema.define(version: 20170310142115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "event_categories", force: :cascade do |t|
    t.integer "event_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_event_categories_on_category_id", using: :btree
    t.index ["event_id"], name: "index_event_categories_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.datetime "datetime"
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.integer  "price"
    t.string   "price_description"
    t.integer  "capacity"
  end

  create_table "members", force: :cascade do |t|
    t.integer "account_id"
    t.string  "name"
    t.string  "about"
    t.integer "age"
    t.string  "gender"
    t.string  "relationship_status"
    t.string  "phone"
    t.string  "hometown"
    t.index ["account_id"], name: "index_members_on_account_id", using: :btree
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer "member_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_rsvps_on_event_id", using: :btree
    t.index ["member_id"], name: "index_rsvps_on_member_id", using: :btree
  end

  add_foreign_key "event_categories", "categories"
  add_foreign_key "event_categories", "events"
  add_foreign_key "members", "accounts"
  add_foreign_key "rsvps", "events"
  add_foreign_key "rsvps", "members"
end
