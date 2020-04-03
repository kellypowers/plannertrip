# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_01_200713) do

  create_table "addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "country"
  end

  create_table "comments", force: :cascade do |t|
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "locations", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end