# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_05_174441) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diet_user_assignments_tables", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "diet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diet_id"], name: "index_diet_user_assignments_tables_on_diet_id"
    t.index ["user_id"], name: "index_diet_user_assignments_tables_on_user_id"
  end

  create_table "diets", force: :cascade do |t|
    t.string "name"
    t.text "components"
    t.text "description"
    t.integer "total_calories"
    t.jsonb "nutrients"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "title"
    t.integer "calories"
    t.jsonb "nutrients"
    t.datetime "eat_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.float "grams"
    t.string "components"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "diet_user_assignments_tables", "diets"
  add_foreign_key "diet_user_assignments_tables", "users"
  add_foreign_key "meals", "users"
end
