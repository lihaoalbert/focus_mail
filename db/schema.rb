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

ActiveRecord::Schema.define(:version => 20120518114231) do

  create_table "campaign_members", :force => true do |t|
    t.integer  "campaign_id"
    t.string   "member_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.string   "from_name"
    t.string   "from_email"
    t.string   "subject"
    t.integer  "template_id"
    t.text     "entries"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "template_id"
    t.string   "name"
    t.string   "default_value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "list_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.string   "file_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
