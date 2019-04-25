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

ActiveRecord::Schema.define(version: 2019_03_23_055830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_id"
    t.text "description"
  end

  create_table "excharts", force: :cascade do |t|
    t.bigint "user_id"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_excharts_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "pattern_no", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "helps", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "member_id"
    t.string "hashed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pattern_groups", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_pattern_groups_on_category_id"
  end

  create_table "patterns", force: :cascade do |t|
    t.integer "pattern_index"
    t.string "pattern_id"
    t.string "pattern_name"
    t.string "summary"
    t.text "context"
    t.string "b_problem"
    t.text "problem"
    t.string "b_solution"
    t.text "solution"
    t.text "consequence"
    t.integer "unit_no"
    t.bigint "category_id"
    t.bigint "pattern_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_patterns_on_category_id"
    t.index ["pattern_group_id"], name: "index_patterns_on_pattern_group_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.text "content"
    t.bigint "pattern_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pattern_id"], name: "index_quotations_on_pattern_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.text "content"
    t.bigint "pattern_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pattern_id"], name: "index_quotes_on_pattern_id"
  end

  create_table "tiny_patterns", force: :cascade do |t|
    t.integer "pattern_no"
    t.string "name"
    t.string "solution"
    t.bigint "pattern_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pattern_id"], name: "index_tiny_patterns_on_pattern_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.integer "favicon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["member_id"], name: "index_users_on_member_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "users", "members"
end
