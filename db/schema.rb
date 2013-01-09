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

ActiveRecord::Schema.define(:version => 20130109160856) do

  create_table "contacts", :force => true do |t|
    t.integer  "phone"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "position"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "contacts", ["email"], :name => "index_contacts_on_email", :unique => true
  add_index "contacts", ["reset_password_token"], :name => "index_contacts_on_reset_password_token", :unique => true

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.text     "rules"
    t.text     "judging"
    t.datetime "start"
    t.datetime "end"
    t.string   "submit_to"
    t.boolean  "team"
    t.integer  "rounds"
    t.integer  "venue_id"
    t.integer  "type_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "events", ["type_id"], :name => "index_events_on_type_id"
  add_index "events", ["venue_id"], :name => "index_events_on_venue_id"

  create_table "events_contacts", :force => true do |t|
    t.integer  "event_id"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "events_contacts", ["contact_id"], :name => "index_events_contacts_on_contact_id"
  add_index "events_contacts", ["event_id"], :name => "index_events_contacts_on_event_id"

  create_table "participations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "active",     :default => true
    t.integer  "level",      :default => 0
    t.integer  "score",      :default => 0
    t.integer  "team_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "participations", ["event_id"], :name => "index_participations_on_event_id"
  add_index "participations", ["team_id"], :name => "index_participations_on_team_id"
  add_index "participations", ["user_id"], :name => "index_participations_on_user_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.integer  "creator_id"
    t.integer  "size",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "teams", ["creator_id"], :name => "index_teams_on_creator_id"
  add_index "teams", ["event_id"], :name => "index_teams_on_event_id"

  create_table "users", :force => true do |t|
    t.integer  "phone"
    t.date     "birthdate"
    t.string   "school"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
