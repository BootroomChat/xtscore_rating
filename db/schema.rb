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

ActiveRecord::Schema.define(version: 20181112183758) do

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "team_name"
    t.string "name"
    t.string "opponent_team_name"
    t.string "match_id"
    t.string "field"
    t.string "stadium"
    t.integer "player_id", default: 0
    t.integer "team_id", default: 0
    t.integer "opponent_team_id", default: 0
    t.decimal "aerial_success", precision: 12, scale: 6
    t.decimal "assist", precision: 12, scale: 6
    t.decimal "assist_corner", precision: 12, scale: 6
    t.decimal "assist_cross", precision: 12, scale: 6
    t.decimal "assist_freekick", precision: 12, scale: 6
    t.decimal "assist_other", precision: 12, scale: 6
    t.decimal "assist_throughball", precision: 12, scale: 6
    t.decimal "assist_throwin", precision: 12, scale: 6
    t.decimal "ball_recovery", precision: 12, scale: 6
    t.decimal "big_chance_created", precision: 12, scale: 6
    t.decimal "big_chance_missed", precision: 12, scale: 6
    t.decimal "big_chance_scored", precision: 12, scale: 6
    t.decimal "challenge_lost", precision: 12, scale: 6
    t.decimal "clean_sheet_amc", precision: 12, scale: 6
    t.decimal "clean_sheet_aml", precision: 12, scale: 6
    t.decimal "clean_sheet_amr", precision: 12, scale: 6
    t.decimal "clean_sheet_dc", precision: 12, scale: 6
    t.decimal "clean_sheet_dl", precision: 12, scale: 6
    t.decimal "clean_sheet_dmc", precision: 12, scale: 6
    t.decimal "clean_sheet_dml", precision: 12, scale: 6
    t.decimal "clean_sheet_dmr", precision: 12, scale: 6
    t.decimal "clean_sheet_dr", precision: 12, scale: 6
    t.decimal "clean_sheet_fw", precision: 12, scale: 6
    t.decimal "clean_sheet_fwl", precision: 12, scale: 6
    t.decimal "clean_sheet_fwr", precision: 12, scale: 6
    t.decimal "clean_sheet_gk", precision: 12, scale: 6
    t.decimal "clean_sheet_mc", precision: 12, scale: 6
    t.decimal "clean_sheet_ml", precision: 12, scale: 6
    t.decimal "clean_sheet_mr", precision: 12, scale: 6
    t.decimal "clean_sheet_sub", precision: 12, scale: 6
    t.decimal "clearance_effective", precision: 12, scale: 6
    t.decimal "clearance_head", precision: 12, scale: 6
    t.decimal "clearance_off_the_line", precision: 12, scale: 6
    t.decimal "clearance_total", precision: 12, scale: 6
    t.decimal "close_miss_high", precision: 12, scale: 6
    t.decimal "close_miss_high_left", precision: 12, scale: 6
    t.decimal "close_miss_high_right", precision: 12, scale: 6
    t.decimal "close_miss_left", precision: 12, scale: 6
    t.decimal "close_miss_right", precision: 12, scale: 6
    t.decimal "collected", precision: 12, scale: 6
    t.decimal "corner_awarded", precision: 12, scale: 6
    t.decimal "defensive_duel", precision: 12, scale: 6
    t.decimal "defensive_third", precision: 12, scale: 6
    t.decimal "dispossessed", precision: 12, scale: 6
    t.decimal "dispossessed_in_d3rd", precision: 12, scale: 6
    t.decimal "dribble_in_middle", precision: 12, scale: 6
    t.decimal "dribble_lastman", precision: 12, scale: 6
    t.decimal "dribble_lost", precision: 12, scale: 6
    t.decimal "dribble_won", precision: 12, scale: 6
    t.decimal "duel_aerial_lost", precision: 12, scale: 6
    t.decimal "duel_aerial_won", precision: 12, scale: 6
    t.decimal "error_leads_to_goal", precision: 12, scale: 6
    t.decimal "error_leads_to_shot", precision: 12, scale: 6
    t.decimal "final_third", precision: 12, scale: 6
    t.decimal "forward_pass_meter", precision: 12, scale: 6
    t.decimal "forward_pass_percentage", precision: 12, scale: 6
    t.decimal "foul_committed", precision: 12, scale: 6
    t.decimal "foul_given", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_amc", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_aml", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_amr", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_dc", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_dl", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_dmc", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_dml", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_dmr", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_dr", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_fw", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_fwl", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_fwr", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_gk", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_mc", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_ml", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_mr", precision: 12, scale: 6
    t.decimal "goal_conceded_by_team_sub", precision: 12, scale: 6
    t.decimal "goal_conceded_outside_box_goalkeeper", precision: 12, scale: 6
    t.decimal "goal_counter", precision: 12, scale: 6
    t.decimal "goal_head", precision: 12, scale: 6
    t.decimal "goal_left_foot", precision: 12, scale: 6
    t.decimal "goal_normal", precision: 12, scale: 6
    t.decimal "goal_obox", precision: 12, scale: 6
    t.decimal "goal_obp", precision: 12, scale: 6
    t.decimal "goal_open_play", precision: 12, scale: 6
    t.decimal "goal_own", precision: 12, scale: 6
    t.decimal "goal_penalty_area", precision: 12, scale: 6
    t.decimal "goal_right_foot", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_amc", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_aml", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_amr", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_dc", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_dl", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_dmc", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_dml", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_dmr", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_dr", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_fw", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_fwl", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_fwr", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_gk", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_mc", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_ml", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_mr", precision: 12, scale: 6
    t.decimal "goal_scored_by_team_sub", precision: 12, scale: 6
    t.decimal "goal_set_piece", precision: 12, scale: 6
    t.decimal "goal_six_yard_box", precision: 12, scale: 6
    t.decimal "intentional_assist", precision: 12, scale: 6
    t.decimal "interception_all", precision: 12, scale: 6
    t.decimal "interception_inthe_box", precision: 12, scale: 6
    t.decimal "interception_won", precision: 12, scale: 6
    t.decimal "involving_open_chance", precision: 12, scale: 6
    t.decimal "keeper_claim_high_lost", precision: 12, scale: 6
    t.decimal "keeper_claim_high_won", precision: 12, scale: 6
    t.decimal "keeper_claim_lost", precision: 12, scale: 6
    t.decimal "keeper_claim_won", precision: 12, scale: 6
    t.decimal "keeper_diving_save", precision: 12, scale: 6
    t.decimal "keeper_missed", precision: 12, scale: 6
    t.decimal "keeper_one_to_one_won", precision: 12, scale: 6
    t.decimal "keeper_penalty_saved", precision: 12, scale: 6
    t.decimal "keeper_save_in_the_box", precision: 12, scale: 6
    t.decimal "keeper_save_total", precision: 12, scale: 6
    t.decimal "keeper_smother", precision: 12, scale: 6
    t.decimal "keeper_sweeper_lost", precision: 12, scale: 6
    t.decimal "key_pass", precision: 12, scale: 6
    t.decimal "key_pass_corner", precision: 12, scale: 6
    t.decimal "key_pass_cross", precision: 12, scale: 6
    t.decimal "key_pass_freekick", precision: 12, scale: 6
    t.decimal "key_pass_long", precision: 12, scale: 6
    t.decimal "key_pass_other", precision: 12, scale: 6
    t.decimal "key_pass_short", precision: 12, scale: 6
    t.decimal "key_pass_throughball", precision: 12, scale: 6
    t.decimal "key_pass_throwin", precision: 12, scale: 6
    t.decimal "mid_third", precision: 12, scale: 6
    t.decimal "minutes", precision: 12, scale: 6
    t.decimal "offensive_duel", precision: 12, scale: 6
    t.decimal "offside_given", precision: 12, scale: 6
    t.decimal "offside_provoked", precision: 12, scale: 6
    t.decimal "outfielder_block", precision: 12, scale: 6
    t.decimal "outfielder_blocked_pass", precision: 12, scale: 6
    t.decimal "overrun", precision: 12, scale: 6
    t.decimal "parried_danger", precision: 12, scale: 6
    t.decimal "parried_safe", precision: 12, scale: 6
    t.decimal "pass_accuracy", precision: 12, scale: 6
    t.decimal "pass_accurate", precision: 12, scale: 6
    t.decimal "pass_back", precision: 12, scale: 6
    t.decimal "pass_back_zone_inaccurate", precision: 12, scale: 6
    t.decimal "pass_chipped", precision: 12, scale: 6
    t.decimal "pass_corner", precision: 12, scale: 6
    t.decimal "pass_corner_accurate", precision: 12, scale: 6
    t.decimal "pass_corner_inaccurate", precision: 12, scale: 6
    t.decimal "pass_cross_accurate", precision: 12, scale: 6
    t.decimal "pass_cross_blocked_defensive", precision: 12, scale: 6
    t.decimal "pass_cross_inaccurate", precision: 12, scale: 6
    t.decimal "pass_distance", precision: 12, scale: 6
    t.decimal "pass_forward", precision: 12, scale: 6
    t.decimal "pass_forward_zone_accurate", precision: 12, scale: 6
    t.decimal "pass_freekick", precision: 12, scale: 6
    t.decimal "pass_freekick_accurate", precision: 12, scale: 6
    t.decimal "pass_freekick_inaccurate", precision: 12, scale: 6
    t.decimal "pass_head", precision: 12, scale: 6
    t.decimal "pass_inaccurate", precision: 12, scale: 6
    t.decimal "pass_key", precision: 12, scale: 6
    t.decimal "pass_leading_kp", precision: 12, scale: 6
    t.decimal "pass_left", precision: 12, scale: 6
    t.decimal "pass_left_foot", precision: 12, scale: 6
    t.decimal "pass_long_ball_accurate", precision: 12, scale: 6
    t.decimal "pass_long_ball_inaccurate", precision: 12, scale: 6
    t.decimal "pass_right", precision: 12, scale: 6
    t.decimal "pass_right_foot", precision: 12, scale: 6
    t.decimal "pass_through_ball_accurate", precision: 12, scale: 6
    t.decimal "pass_through_ball_inaccurate", precision: 12, scale: 6
    t.decimal "pass_through_ball_inacurate", precision: 12, scale: 6
    t.decimal "pass_to_a3rd", precision: 12, scale: 6
    t.decimal "penalty_conceded", precision: 12, scale: 6
    t.decimal "penalty_missed", precision: 12, scale: 6
    t.decimal "penalty_scored", precision: 12, scale: 6
    t.decimal "penalty_shootout_conceded_gk", precision: 12, scale: 6
    t.decimal "penalty_shootout_missed_off_target", precision: 12, scale: 6
    t.decimal "penalty_shootout_saved", precision: 12, scale: 6
    t.decimal "penalty_shootout_saved_gk", precision: 12, scale: 6
    t.decimal "penalty_shootout_scored", precision: 12, scale: 6
    t.decimal "penalty_won", precision: 12, scale: 6
    t.decimal "pos", precision: 12, scale: 6
    t.decimal "punches", precision: 12, scale: 6
    t.decimal "recovery_x", precision: 12, scale: 6
    t.decimal "red_card", precision: 12, scale: 6
    t.decimal "save_feet", precision: 12, scale: 6
    t.decimal "save_hands", precision: 12, scale: 6
    t.decimal "save_high_centre", precision: 12, scale: 6
    t.decimal "save_high_left", precision: 12, scale: 6
    t.decimal "save_high_right", precision: 12, scale: 6
    t.decimal "save_low_centre", precision: 12, scale: 6
    t.decimal "save_low_left", precision: 12, scale: 6
    t.decimal "save_low_right", precision: 12, scale: 6
    t.decimal "save_obox", precision: 12, scale: 6
    t.decimal "save_obp", precision: 12, scale: 6
    t.decimal "save_penalty_area", precision: 12, scale: 6
    t.decimal "save_six_yard_box", precision: 12, scale: 6
    t.decimal "second_yellow", precision: 12, scale: 6
    t.decimal "short_pass_accurate", precision: 12, scale: 6
    t.decimal "short_pass_inaccurate", precision: 12, scale: 6
    t.decimal "shot_blocked", precision: 12, scale: 6
    t.decimal "shot_counter", precision: 12, scale: 6
    t.decimal "shot_head", precision: 12, scale: 6
    t.decimal "shot_left_foot", precision: 12, scale: 6
    t.decimal "shot_obox_total", precision: 12, scale: 6
    t.decimal "shot_obp", precision: 12, scale: 6
    t.decimal "shot_off_target", precision: 12, scale: 6
    t.decimal "shot_off_target_inside_box", precision: 12, scale: 6
    t.decimal "shot_on_post", precision: 12, scale: 6
    t.decimal "shot_on_target", precision: 12, scale: 6
    t.decimal "shot_open_play", precision: 12, scale: 6
    t.decimal "shot_penalty_area", precision: 12, scale: 6
    t.decimal "shot_right_foot", precision: 12, scale: 6
    t.decimal "shot_set_piece", precision: 12, scale: 6
    t.decimal "shot_six_yard_box", precision: 12, scale: 6
    t.decimal "shots_total", precision: 12, scale: 6
    t.decimal "six_yard_block", precision: 12, scale: 6
    t.decimal "standing_save", precision: 12, scale: 6
    t.decimal "sub_off", precision: 12, scale: 6
    t.decimal "sub_on", precision: 12, scale: 6
    t.decimal "successful_final_third_passes", precision: 12, scale: 6
    t.decimal "successful_pass_to_a3rd", precision: 12, scale: 6
    t.decimal "tackle_last_man", precision: 12, scale: 6
    t.decimal "tackle_lost", precision: 12, scale: 6
    t.decimal "tackle_won", precision: 12, scale: 6
    t.decimal "throw_in", precision: 12, scale: 6
    t.decimal "total_pass", precision: 12, scale: 6
    t.decimal "touches", precision: 12, scale: 6
    t.decimal "turnover", precision: 12, scale: 6
    t.decimal "void_yellow_card", precision: 12, scale: 6
    t.decimal "yellow_card", precision: 12, scale: 6
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
