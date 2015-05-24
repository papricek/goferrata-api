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

ActiveRecord::Schema.define(version: 20150521085550) do

  create_table "points", force: :cascade do |t|
    t.string   "link"
    t.string   "name"
    t.string   "state"
    t.string   "region"
    t.string   "locality"
    t.string   "lat"
    t.string   "lng"
    t.string   "start"
    t.string   "target"
    t.integer  "duration"
    t.integer  "elevationdiff"
    t.integer  "height"
    t.string   "slug"
    t.string   "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "info"
    t.string   "access_token"
    t.datetime "access_token_updated_at"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
