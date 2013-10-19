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

ActiveRecord::Schema.define(version: 20131019094453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json     "tmdb_data",  default: {}
  end

  create_table "countries_movies", force: true do |t|
    t.integer "movie_id"
    t.integer "country_id"
  end

  add_index "countries_movies", ["country_id"], name: "index_countries_movies_on_country_id", using: :btree
  add_index "countries_movies", ["movie_id"], name: "index_countries_movies_on_movie_id", using: :btree

  create_table "forum_categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forum_categories", ["title"], name: "index_forum_categories_on_title", using: :btree

  create_table "forum_messages", force: true do |t|
    t.integer  "thread_id"
    t.integer  "author_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forum_messages", ["author_id"], name: "index_forum_messages_on_author_id", using: :btree
  add_index "forum_messages", ["thread_id"], name: "index_forum_messages_on_thread_id", using: :btree

  create_table "forum_threads", force: true do |t|
    t.string   "title"
    t.integer  "author_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discussible_id"
    t.string   "discussible_type"
  end

  add_index "forum_threads", ["author_id"], name: "index_forum_threads_on_author_id", using: :btree
  add_index "forum_threads", ["category_id"], name: "index_forum_threads_on_category_id", using: :btree
  add_index "forum_threads", ["discussible_id", "discussible_type"], name: "index_forum_threads_on_discussible_id_and_discussible_type", using: :btree

  create_table "genres", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json     "tmdb_data",  default: {}
  end

  create_table "genres_movies", force: true do |t|
    t.integer "movie_id"
    t.integer "genre_id"
  end

  add_index "genres_movies", ["genre_id"], name: "index_genres_movies_on_genre_id", using: :btree
  add_index "genres_movies", ["movie_id"], name: "index_genres_movies_on_movie_id", using: :btree

  create_table "grades", force: true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grades", ["movie_id"], name: "index_grades_on_movie_id", using: :btree
  add_index "grades", ["user_id"], name: "index_grades_on_user_id", using: :btree

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
    t.decimal  "budget",              precision: 18, scale: 4
    t.string   "rating"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.json     "tmdb_data",                                    default: {}
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "orig_name"
    t.date     "birthdate"
    t.string   "birthplace"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.json     "tmdb_data",          default: {}
  end

  create_table "reviews", force: true do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "approved",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "title"
    t.decimal  "fee",             precision: 18, scale: 4
    t.integer  "movie_person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "username",               default: "",      null: false
    t.string   "role",                   default: "guest", null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
