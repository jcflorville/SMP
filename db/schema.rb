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

ActiveRecord::Schema.define(:version => 20120318212514) do

  create_table "movies", :force => true do |t|
    t.string   "title_eng"
    t.string   "title_esp"
    t.integer  "stock"
    t.string   "category"
    t.string   "imdb"
    t.string   "description"
    t.string   "quality"
    t.string   "type_movie"
    t.string   "menu"
    t.string   "cast"
    t.string   "directors"
    t.string   "code"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "returns", :force => true do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "returns", ["movie_id"], :name => "index_returns_on_movie_id"
  add_index "returns", ["user_id"], :name => "index_returns_on_user_id"

  create_table "sales", :force => true do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["movie_id"], :name => "index_sales_on_movie_id"
  add_index "sales", ["user_id"], :name => "index_sales_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "last"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
