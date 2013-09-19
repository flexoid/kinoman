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

ActiveRecord::Schema.define(version: 20130919175238) do

  create_table "countries", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries_movies", force: true do |t|
    t.integer "movie_id"
    t.integer "country_id"
  end

  add_index "countries_movies", ["country_id"], name: "index_countries_movies_on_country_id", using: :btree
  add_index "countries_movies", ["movie_id"], name: "index_countries_movies_on_movie_id", using: :btree

  create_table "genres", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres_movies", force: true do |t|
    t.integer "movie_id"
    t.integer "genre_id"
  end

  add_index "genres_movies", ["genre_id"], name: "index_genres_movies_on_genre_id", using: :btree
  add_index "genres_movies", ["movie_id"], name: "index_genres_movies_on_movie_id", using: :btree

  create_table "movie_people", force: true do |t|
    t.integer  "movie_id"
    t.integer  "person_id"
    t.string   "person_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movie_people", ["movie_id"], name: "index_movie_people_on_movie_id", using: :btree
  add_index "movie_people", ["person_id"], name: "index_movie_people_on_person_id", using: :btree

  create_table "movies", force: true do |t|
    t.string   "title"
    t.string   "orig_title"
    t.integer  "year"
    t.decimal  "budget",     precision: 18, scale: 4
    t.string   "rating"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "orig_name"
    t.date     "birthdate"
    t.string   "birthplace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "title"
    t.decimal  "fee",             precision: 10, scale: 0
    t.integer  "movie_person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
