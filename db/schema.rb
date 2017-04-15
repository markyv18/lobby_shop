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

ActiveRecord::Schema.define(version: 20170415200000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "officials", force: :cascade do |t|
    t.string   "name"
    t.string   "img_path"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total_price"
    t.integer  "status",      default: 0
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scumbag_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "scumbag_id"
    t.integer  "scumbag_quantity"
    t.integer  "scumbag_price"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["order_id"], name: "index_scumbag_orders_on_order_id", using: :btree
    t.index ["scumbag_id"], name: "index_scumbag_orders_on_scumbag_id", using: :btree
  end

  create_table "scumbags", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "image_path"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "party_id"
    t.integer  "branch_id"
    t.integer  "status",     default: 0
    t.index ["branch_id"], name: "index_scumbags_on_branch_id", using: :btree
    t.index ["party_id"], name: "index_scumbags_on_party_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "role",                  default: 0
  end

  add_foreign_key "orders", "users"
  add_foreign_key "scumbag_orders", "orders"
  add_foreign_key "scumbag_orders", "scumbags"
  add_foreign_key "scumbags", "branches"
  add_foreign_key "scumbags", "parties"
end
