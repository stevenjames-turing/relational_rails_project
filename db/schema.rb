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

ActiveRecord::Schema.define(version: 2022_02_02_224537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: :cascade do |t|
    t.integer "count"
    t.boolean "protective"
    t.string "brand"
    t.bigint "hockey_bag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hockey_bag_id"], name: "index_equipment_on_hockey_bag_id"
  end

  create_table "golf_courses", force: :cascade do |t|
    t.string "name"
    t.integer "holes"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hockey_bags", force: :cascade do |t|
    t.string "player"
    t.integer "pockets"
    t.boolean "stinky"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holes", force: :cascade do |t|
    t.boolean "hazard"
    t.string "pin_location"
    t.integer "par"
    t.bigint "golf_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["golf_course_id"], name: "index_holes_on_golf_course_id"
  end

  add_foreign_key "equipment", "hockey_bags"
  add_foreign_key "holes", "golf_courses"
end
