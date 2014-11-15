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

ActiveRecord::Schema.define(version: 20141115122213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "phone"
    t.string   "company"
    t.string   "zip"
    t.string   "city"
    t.string   "street"
    t.string   "apartment"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.integer  "user_id"
    t.datetime "time"
    t.string   "device_type"
    t.string   "model"
    t.string   "description"
    t.boolean  "warranty"
    t.string   "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "surname"
    t.string   "phone"
    t.string   "company"
    t.string   "zip"
    t.string   "street"
    t.string   "apartment"
    t.string   "city"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.boolean  "admin"
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_encrypted"
  end

end
