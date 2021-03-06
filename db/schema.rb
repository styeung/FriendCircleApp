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

ActiveRecord::Schema.define(version: 20140806192155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circle_memberships", force: true do |t|
    t.integer  "circle_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "circle_memberships", ["circle_id"], name: "index_circle_memberships_on_circle_id", using: :btree
  add_index "circle_memberships", ["member_id"], name: "index_circle_memberships_on_member_id", using: :btree

  create_table "circles", force: true do |t|
    t.string   "name",       null: false
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "circles", ["owner_id"], name: "index_circles_on_owner_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "body",         null: false
    t.integer  "commenter_id", null: false
    t.integer  "post_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commenter_id"], name: "index_comments_on_commenter_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "links", force: true do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["post_id"], name: "index_links_on_post_id", using: :btree

  create_table "post_shares", force: true do |t|
    t.integer  "circle_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_shares", ["circle_id"], name: "index_post_shares_on_circle_id", using: :btree
  add_index "post_shares", ["post_id"], name: "index_post_shares_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.text     "body",       null: false
    t.integer  "poster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["poster_id"], name: "index_posts_on_poster_id", using: :btree

  create_table "upvotes", force: true do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upvotes", ["post_id"], name: "index_upvotes_on_post_id", using: :btree
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "forgot_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
