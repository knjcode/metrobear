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

ActiveRecord::Schema.define(version: 20141117012832) do

  create_table "comments", force: true do |t|
    t.string   "content",    limit: 400, null: false
    t.integer  "user_id"
    t.integer  "station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  add_index "comments", ["station_id"], name: "index_comments_on_station_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "stations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",                   null: false
    t.string   "uid",                        null: false
    t.string   "nickname",                   null: false
    t.string   "image_url",                  null: false
    t.text     "trophies"
    t.integer  "visiting_count", default: 0
    t.integer  "trophy_count",   default: 0
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true

  create_table "visitings", force: true do |t|
    t.integer  "user_id"
    t.integer  "station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visitings", ["station_id"], name: "index_visitings_on_station_id"
  add_index "visitings", ["user_id"], name: "index_visitings_on_user_id"

end
