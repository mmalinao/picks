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

ActiveRecord::Schema.define(version: 20150304053125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "games", force: :cascade do |t|
    t.datetime "schedule"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "home_team_id"
    t.integer  "away_team_id"
  end

  add_index "games", ["away_team_id"], name: "index_games_on_away_team_id", using: :btree
  add_index "games", ["home_team_id"], name: "index_games_on_home_team_id", using: :btree

  create_table "picks", force: :cascade do |t|
    t.integer  "sports_team_id"
    t.integer  "wins_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "slack_user_sid"
  end

  add_index "picks", ["slack_user_sid"], name: "index_picks_on_slack_user_sid", using: :btree
  add_index "picks", ["sports_team_id"], name: "index_picks_on_sports_team_id", using: :btree

  create_table "slack_channels", id: false, force: :cascade do |t|
    t.string   "sid",                       null: false
    t.integer  "slack_team_id"
    t.integer  "sports_type",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slack_channels", ["sid"], name: "index_slack_channels_on_sid", unique: true, using: :btree
  add_index "slack_channels", ["slack_team_id"], name: "index_slack_channels_on_slack_team_id", using: :btree

  create_table "slack_channels_users", id: false, force: :cascade do |t|
    t.string   "slack_channel_sid", null: false
    t.string   "slack_user_sid",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slack_channels_users", ["slack_channel_sid"], name: "index_slack_channels_users_on_slack_channel_sid", using: :btree
  add_index "slack_channels_users", ["slack_user_sid"], name: "index_slack_channels_users_on_slack_user_sid", using: :btree

  create_table "slack_teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "token"
    t.string   "domain"
  end

  add_index "slack_teams", ["domain"], name: "index_slack_teams_on_domain", using: :btree
  add_index "slack_teams", ["token"], name: "index_slack_teams_on_token", using: :btree

  create_table "slack_users", id: false, force: :cascade do |t|
    t.string   "sid",        null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slack_users", ["sid"], name: "index_slack_users_on_sid", unique: true, using: :btree

  create_table "sports_teams", force: :cascade do |t|
    t.string   "type"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sports_teams", ["uid"], name: "index_sports_teams_on_uid", using: :btree

end
