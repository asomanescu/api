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

ActiveRecord::Schema.define(version: 20160417105958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "episodes", force: :cascade do |t|
    t.string   "name"
    t.date     "release_date"
    t.integer  "season"
    t.integer  "episode_number"
    t.text     "overview"
    t.float    "rating"
    t.integer  "series_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["series_id"], name: "index_episodes_on_series_id", using: :btree
  end

  create_table "series", force: :cascade do |t|
    t.string   "name"
    t.float    "rating"
    t.string   "status"
    t.datetime "first_aired"
    t.string   "fan_art"
    t.text     "overview"
    t.string   "genre"
    t.string   "banner"
    t.string   "imdb_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
