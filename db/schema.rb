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

ActiveRecord::Schema.define(version: 20150228210905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.integer  "slack_user_id"
    t.integer  "sports_team_id"
    t.integer  "wins_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "picks", ["slack_user_id"], name: "index_picks_on_slack_user_id", using: :btree
  add_index "picks", ["sports_team_id"], name: "index_picks_on_sports_team_id", using: :btree

  create_table "slack_channels", force: :cascade do |t|
    t.string   "slack_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "slack_team_id"
    t.integer  "sports_type"
  end

  add_index "slack_channels", ["slack_id"], name: "index_slack_channels_on_slack_id", using: :btree
  add_index "slack_channels", ["slack_team_id"], name: "index_slack_channels_on_slack_team_id", using: :btree

  create_table "slack_teams", force: :cascade do |t|
    t.string   "slack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "token"
  end

  add_index "slack_teams", ["slack_id"], name: "index_slack_teams_on_slack_id", using: :btree
  add_index "slack_teams", ["token"], name: "index_slack_teams_on_token", using: :btree

  create_table "slack_users", force: :cascade do |t|
    t.string   "slack_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "slack_users", ["slack_id"], name: "index_slack_users_on_slack_id", using: :btree

  create_table "sports_teams", force: :cascade do |t|
    t.string   "type"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sports_teams", ["uid"], name: "index_sports_teams_on_uid", using: :btree

end
