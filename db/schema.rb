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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131111143153) do

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "salary"
    t.integer  "home_run_cost"
    t.integer  "win_cost"
    t.integer  "team_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.decimal  "cost_performance_score"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "payroll"
    t.integer  "cost_per_win"
    t.integer  "league_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
