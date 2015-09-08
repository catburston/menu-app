# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150908063115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groceries", force: true do |t|
    t.string   "name"
    t.string   "section"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groceries_shopping_lists", id: false, force: true do |t|
    t.integer "grocery_id"
    t.integer "shopping_list_id"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "shop_section"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients_recipes", id: false, force: true do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
  end

  create_table "menus", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus_recipes", id: false, force: true do |t|
    t.integer "menu_id"
    t.integer "recipe_id"
  end

  create_table "quantities", force: true do |t|
    t.integer "amount"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.string   "recipe_category"
    t.string   "recipe_type"
    t.string   "chef"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "method"
  end

  create_table "shopping_lists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "menu_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
