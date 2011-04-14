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

ActiveRecord::Schema.define(:version => 20110414115036) do

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_entries", :force => true do |t|
    t.string   "message"
    t.integer  "user_id"
    t.integer  "microtask_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microtasks", :force => true do |t|
    t.integer  "task_id"
    t.integer  "translator_id"
    t.float    "points"
    t.text     "paragraph"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "paragraph_index"
    t.text     "translated_paragraph"
    t.string   "status",               :default => "Open"
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "deadline"
    t.integer  "requester_id"
    t.integer  "language_from"
    t.integer  "language_to"
    t.float    "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",  :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",  :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.float    "points",                              :default => 0.0
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
