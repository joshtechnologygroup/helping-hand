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

ActiveRecord::Schema.define(version: 20190927192556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keyword_collections", force: :cascade do |t|
    t.string   "keyword"
    t.string   "similar_keyword"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "team"
    t.string   "organisation"
    t.string   "designation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_owners_on_user_id", using: :btree
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.string   "last_updated_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "task_keyword_collections", force: :cascade do |t|
    t.integer "task_id"
    t.integer "keyword_collection_id"
    t.index ["keyword_collection_id"], name: "index_task_keyword_collections_on_keyword_collection_id", using: :btree
    t.index ["task_id"], name: "index_task_keyword_collections_on_task_id", using: :btree
  end

  create_table "task_owners", force: :cascade do |t|
    t.integer "task_id"
    t.integer "owner_id"
    t.index ["owner_id"], name: "index_task_owners_on_owner_id", using: :btree
    t.index ["task_id"], name: "index_task_owners_on_task_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title",                  null: false
    t.text     "problem"
    t.text     "solution"
    t.integer  "upvotes",    default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "source_id"
    t.index ["source_id"], name: "index_tasks_on_source_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 50,                          null: false
    t.string   "last_name",       limit: 50
    t.string   "email",                                               null: false
    t.string   "password_digest",                                     null: false
    t.integer  "role",                       default: 0,              null: false
    t.integer  "gender"
    t.string   "phone_number",    limit: 15
    t.string   "github_username", limit: 50
    t.integer  "experience"
    t.string   "designation",     limit: 50
    t.datetime "last_seen",                  default: -> { "now()" }
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
