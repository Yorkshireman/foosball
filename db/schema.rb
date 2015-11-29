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

ActiveRecord::Schema.define(version: 20151129140245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "match_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "winning_score"
  end

  add_index "games", ["match_id"], name: "index_games_on_match_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "league_id"
    t.integer  "winning_team_id"
  end

  add_index "matches", ["league_id"], name: "index_matches_on_league_id", using: :btree

  create_table "matches_teams", id: false, force: :cascade do |t|
    t.integer "match_id"
    t.integer "team_id"
  end

  add_index "matches_teams", ["match_id"], name: "index_matches_teams_on_match_id", using: :btree
  add_index "matches_teams", ["team_id"], name: "index_matches_teams_on_team_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "players", ["league_id"], name: "index_players_on_league_id", using: :btree

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
  end

  add_index "players_teams", ["player_id"], name: "index_players_teams_on_player_id", using: :btree
  add_index "players_teams", ["team_id"], name: "index_players_teams_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "league_id"
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree

  add_foreign_key "games", "matches"
  add_foreign_key "matches", "leagues"
  add_foreign_key "players", "leagues"
  add_foreign_key "teams", "leagues"
end
