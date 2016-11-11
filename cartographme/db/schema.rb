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

ActiveRecord::Schema.define(version: 20161111020434) do

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.string "key_locations"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "key_locations", force: :cascade do |t|
    t.string "lat"
    t.string "lng"
    t.string "name"
    t.text   "description"
  end

  create_table "key_locations_users", id: false, force: :cascade do |t|
    t.integer "key_location_id"
    t.integer "user_id"
  end

  add_index "key_locations_users", ["key_location_id", "user_id"], name: "index_key_locations_users_on_key_location_id_and_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "session_token"
    t.string   "password_digest"
    t.string   "home_city"
    t.string   "recommended_places"
    t.string   "places_visited"
    t.string   "following"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
