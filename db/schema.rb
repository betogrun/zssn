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

ActiveRecord::Schema.define(version: 20161212101035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "denouncements", force: :cascade do |t|
    t.integer  "survivor_id"
    t.integer  "denounced_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["survivor_id"], name: "index_denouncements_on_survivor_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "kind"
    t.integer  "survivor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["survivor_id"], name: "index_items_on_survivor_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "lat"
    t.string   "lon"
    t.integer  "survivor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["survivor_id"], name: "index_locations_on_survivor_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.text     "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survivors", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "gender"
    t.boolean  "is_infected", default: false, null: false
    t.integer  "complaints"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "denouncements", "survivors"
  add_foreign_key "items", "survivors"
  add_foreign_key "locations", "survivors"
end
