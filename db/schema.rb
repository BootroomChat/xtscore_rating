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

ActiveRecord::Schema.define(version: 20180812145514) do

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formation_locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "formation_id"
    t.bigint "match_id"
    t.bigint "team_id"
    t.bigint "player_id"
    t.float "x", limit: 24
    t.float "y", limit: 24
    t.index ["formation_id"], name: "index_formation_locations_on_formation_id"
    t.index ["match_id"], name: "index_formation_locations_on_match_id"
    t.index ["player_id"], name: "index_formation_locations_on_player_id"
    t.index ["team_id"], name: "index_formation_locations_on_team_id"
  end

  create_table "formations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "match_id"
    t.bigint "team_id"
    t.integer "captain_id"
    t.integer "start_min"
    t.integer "end_min"
    t.integer "formation_index"
    t.string "name"
    t.index ["match_id"], name: "index_formations_on_match_id"
    t.index ["team_id"], name: "index_formations_on_team_id"
  end

  create_table "leagues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "match_id"
    t.bigint "team_id"
    t.bigint "player_id"
    t.bigint "position_id"
    t.decimal "adjusted_rating", precision: 12, scale: 6
    t.decimal "overall_rating", precision: 12, scale: 6
    t.decimal "parried_danger_rating", precision: 12, scale: 6
    t.decimal "ccc_passes_rating", precision: 12, scale: 6
    t.decimal "shots_accuracy_rating", precision: 12, scale: 6
    t.decimal "errors_rating", precision: 12, scale: 6
    t.decimal "goals_conceded_rating", precision: 12, scale: 6
    t.decimal "dribble_success_rating", precision: 12, scale: 6
    t.decimal "aerial_success_rating", precision: 12, scale: 6
    t.decimal "collected_rating", precision: 12, scale: 6
    t.decimal "total_saves_rating", precision: 12, scale: 6
    t.decimal "dribbled_past_rating", precision: 12, scale: 6
    t.decimal "goals_rating", precision: 12, scale: 6
    t.decimal "defense_three_ratting", precision: 12, scale: 6
    t.decimal "passes_accuracy_rating", precision: 12, scale: 6
    t.decimal "play_mins", precision: 12, scale: 6
    t.decimal "result", precision: 12, scale: 6
    t.decimal "goals", precision: 12, scale: 6
    t.decimal "assists", precision: 12, scale: 6
    t.decimal "goals_conceded", precision: 12, scale: 6
    t.decimal "penalty_conceded", precision: 12, scale: 6
    t.decimal "corners_total", precision: 12, scale: 6
    t.decimal "aerials_won", precision: 12, scale: 6
    t.decimal "dribbles_lost", precision: 12, scale: 6
    t.decimal "shots_total", precision: 12, scale: 6
    t.decimal "passes_accurate", precision: 12, scale: 6
    t.decimal "tackle_unsuccesful", precision: 12, scale: 6
    t.decimal "defensive_aerials", precision: 12, scale: 6
    t.decimal "aerials_total", precision: 12, scale: 6
    t.decimal "offensive_aerials", precision: 12, scale: 6
    t.decimal "passes_total", precision: 12, scale: 6
    t.decimal "throw_ins_total", precision: 12, scale: 6
    t.decimal "offsides_caught", precision: 12, scale: 6
    t.decimal "interceptions", precision: 12, scale: 6
    t.decimal "ratings", precision: 12, scale: 6
    t.decimal "touches", precision: 12, scale: 6
    t.decimal "dispossessed", precision: 12, scale: 6
    t.decimal "parried_safe", precision: 12, scale: 6
    t.decimal "claims_high", precision: 12, scale: 6
    t.decimal "clearances", precision: 12, scale: 6
    t.decimal "throw_in_accuracy", precision: 12, scale: 6
    t.decimal "collected", precision: 12, scale: 6
    t.decimal "parried_danger", precision: 12, scale: 6
    t.decimal "possession", precision: 12, scale: 6
    t.decimal "shots_off_target", precision: 12, scale: 6
    t.decimal "dribbles_attempted", precision: 12, scale: 6
    t.decimal "shots_on_post", precision: 12, scale: 6
    t.decimal "dribbles_won", precision: 12, scale: 6
    t.decimal "corners_accurate", precision: 12, scale: 6
    t.decimal "tackle_success", precision: 12, scale: 6
    t.decimal "throw_ins_accurate", precision: 12, scale: 6
    t.decimal "dribble_success", precision: 12, scale: 6
    t.decimal "errors_count", precision: 12, scale: 6
    t.decimal "aerial_success", precision: 12, scale: 6
    t.decimal "shots_blocked", precision: 12, scale: 6
    t.decimal "tackles_total", precision: 12, scale: 6
    t.decimal "tackle_successful", precision: 12, scale: 6
    t.decimal "shots_on_target", precision: 12, scale: 6
    t.decimal "dribbled_past", precision: 12, scale: 6
    t.decimal "passes_key", precision: 12, scale: 6
    t.decimal "fouls_commited", precision: 12, scale: 6
    t.decimal "total_saves", precision: 12, scale: 6
    t.decimal "pass_success", precision: 12, scale: 6
    t.decimal "claims_total", precision: 12, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "claims_ground", precision: 12, scale: 6
    t.index ["match_id"], name: "index_match_stats_on_match_id"
    t.index ["player_id"], name: "index_match_stats_on_player_id"
    t.index ["position_id"], name: "index_match_stats_on_position_id"
    t.index ["team_id"], name: "index_match_stats_on_team_id"
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.date "date"
    t.time "time"
    t.string "file_path"
    t.integer "home_id"
    t.integer "away_id"
    t.bigint "venue_id"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_matches_on_league_id"
    t.index ["venue_id"], name: "index_matches_on_venue_id"
  end

  create_table "player_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "player_id"
    t.float "weight", limit: 24
    t.float "height", limit: 24
    t.integer "age"
    t.integer "shirt_no"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_player_infos_on_player_id"
    t.index ["team_id"], name: "index_player_infos_on_team_id"
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_teams_on_country_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "xt_ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id"
    t.bigint "match_stat_id"
    t.decimal "offense", precision: 12, scale: 6
    t.decimal "supporting", precision: 12, scale: 6
    t.decimal "closing_down", precision: 12, scale: 6
    t.decimal "breakthrough", precision: 12, scale: 6
    t.decimal "forwarding", precision: 12, scale: 6
    t.decimal "offball", precision: 12, scale: 6
    t.decimal "organizing", precision: 12, scale: 6
    t.decimal "crossing", precision: 12, scale: 6
    t.decimal "defense_participating", precision: 12, scale: 6
    t.decimal "marking", precision: 12, scale: 6
    t.decimal "protecting", precision: 12, scale: 6
    t.decimal "aerial", precision: 12, scale: 6
    t.decimal "passing", precision: 12, scale: 6
    t.decimal "pouncing", precision: 12, scale: 6
    t.decimal "defensive_organizing", precision: 12, scale: 6
    t.decimal "attacking_overall", precision: 12, scale: 6
    t.decimal "defensing_overall", precision: 12, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_stat_id"], name: "index_xt_ratings_on_match_stat_id"
    t.index ["user_id"], name: "index_xt_ratings_on_user_id"
  end

  add_foreign_key "formation_locations", "formations"
  add_foreign_key "formation_locations", "matches"
  add_foreign_key "formation_locations", "players"
  add_foreign_key "formation_locations", "teams"
  add_foreign_key "formations", "matches"
  add_foreign_key "formations", "teams"
  add_foreign_key "match_stats", "matches"
  add_foreign_key "match_stats", "players"
  add_foreign_key "match_stats", "positions"
  add_foreign_key "match_stats", "teams"
  add_foreign_key "matches", "leagues"
  add_foreign_key "matches", "venues"
  add_foreign_key "player_infos", "players"
  add_foreign_key "player_infos", "teams"
  add_foreign_key "teams", "countries"
  add_foreign_key "xt_ratings", "match_stats"
  add_foreign_key "xt_ratings", "users"
end
