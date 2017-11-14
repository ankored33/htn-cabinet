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

ActiveRecord::Schema.define(version: 20171114085857) do

  create_table "cabinets", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sori"
    t.string "somu"
    t.string "homu"
    t.string "gaimu"
    t.string "zaimu"
    t.string "monbukagaku"
    t.string "koseirodo"
    t.string "norinsuisan"
    t.string "keizaisangyo"
    t.string "kokudokotsu"
    t.string "kankyo"
    t.string "boei"
    t.string "kanbo"
    t.string "koan"
    t.string "tokumei_masuda"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
