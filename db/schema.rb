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

ActiveRecord::Schema.define(version: 20171120104434) do

  create_table "pokemon", force: :cascade do |t|
    t.string  "name"
    t.string  "type_1"
    t.string  "type_2"
    t.integer "height"
    t.integer "weight"
    t.integer "level"
    t.string  "nickname"
    t.integer "trainer_id"
    t.integer "speed"
    t.integer "special_defense"
    t.integer "special_attack"
    t.integer "defense"
    t.integer "attack"
    t.integer "hp"
    t.integer "pokedex_number"
    t.string  "shiny"
  end

  create_table "pokemon_bases", force: :cascade do |t|
    t.string  "name"
    t.string  "type_1"
    t.string  "type_2"
    t.integer "height"
    t.integer "weight"
    t.integer "level"
    t.integer "speed"
    t.integer "special_defense"
    t.integer "special_attack"
    t.integer "defense"
    t.integer "attack"
    t.integer "hp"
  end

  create_table "trainers", force: :cascade do |t|
    t.string  "username"
    t.string  "email"
    t.string  "password_digest"
    t.integer "age"
    t.string  "first_name"
    t.string  "last_name"
    t.integer "candy"
    t.integer "pokeballs"
  end

end
