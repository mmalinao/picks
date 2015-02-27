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

ActiveRecord::Schema.define(version: 20150227021626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "slack_channels", force: :cascade do |t|
    t.string   "slack_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "slack_team_id"
  end

  add_index "slack_channels", ["slack_id"], name: "index_slack_channels_on_slack_id", using: :btree
  add_index "slack_channels", ["slack_team_id"], name: "index_slack_channels_on_slack_team_id", using: :btree

  create_table "slack_teams", force: :cascade do |t|
    t.string   "slack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "slack_teams", ["slack_id"], name: "index_slack_teams_on_slack_id", using: :btree

  create_table "slack_users", force: :cascade do |t|
    t.string   "slack_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "slack_team_id"
  end

  add_index "slack_users", ["slack_id"], name: "index_slack_users_on_slack_id", using: :btree
  add_index "slack_users", ["slack_team_id"], name: "index_slack_users_on_slack_team_id", using: :btree

end
