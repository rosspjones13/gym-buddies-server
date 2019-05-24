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

ActiveRecord::Schema.define(version: 2019_04_11_145459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buddies", force: :cascade do |t|
    t.bigint "requester_id"
    t.bigint "requestee_id"
    t.string "buddy_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requestee_id"], name: "index_buddies_on_requestee_id"
    t.index ["requester_id"], name: "index_buddies_on_requester_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "start_image"
    t.string "end_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "goal_type"
    t.integer "measurable_achievement"
    t.date "achieve_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "buddy_id"
    t.text "content"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buddy_id"], name: "index_messages_on_buddy_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "status"
    t.string "checkin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.integer "reps"
    t.integer "measurable_amount"
    t.date "workout_date"
    t.bigint "exercise_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_workouts_on_exercise_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "goals", "users"
  add_foreign_key "workouts", "exercises"
  add_foreign_key "workouts", "users"
end
