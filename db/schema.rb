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

ActiveRecord::Schema.define(version: 2018_06_05_175943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "segments", force: :cascade do |t|
    t.string "name"
    t.float "distance"
    t.float "average_grade"
    t.float "maximum_grade"
    t.float "elevation_high"
    t.float "elevation_low"
    t.float "total_elevation_gain"
    t.integer "athlete_attempts"
    t.integer "unique_athletes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournament_segments", force: :cascade do |t|
    t.bigint "tournament_id"
    t.bigint "segment_id"
    t.index ["segment_id"], name: "index_tournament_segments_on_segment_id"
    t.index ["tournament_id"], name: "index_tournament_segments_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_segments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "segment_id"
    t.integer "pr"
    t.index ["segment_id"], name: "index_user_segments_on_segment_id"
    t.index ["user_id"], name: "index_user_segments_on_user_id"
  end

  create_table "user_tournaments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.index ["tournament_id"], name: "index_user_tournaments_on_tournament_id"
    t.index ["user_id"], name: "index_user_tournaments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "uid"
    t.string "token"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "status", default: 0
  end

  add_foreign_key "tournament_segments", "segments"
  add_foreign_key "tournament_segments", "tournaments"
  add_foreign_key "user_segments", "segments"
  add_foreign_key "user_segments", "users"
  add_foreign_key "user_tournaments", "tournaments"
  add_foreign_key "user_tournaments", "users"
end
