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

ActiveRecord::Schema.define(version: 2018_03_14_113025) do

  create_table "competitions", force: :cascade do |t|
    t.string "caption"
    t.string "tagline"
    t.string "button_name"
    t.date "ending_date"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "competition_type"
  end

  create_table "uploads", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uploaded_by_id"
    t.integer "competition_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type", default: "User"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "gender"
    t.date "dateofbirth"
    t.integer "telephone"
  end

  create_table "videos", force: :cascade do |t|
    t.string "video"
    t.integer "video_uploaded_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "competition_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "voted_by_id"
    t.integer "voted_for_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "competition_id"
    t.integer "voteable_id"
    t.string "voteable_type"
  end

end
