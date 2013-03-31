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

ActiveRecord::Schema.define(:version => 20130329163055) do

  create_table "payments", :force => true do |t|
    t.integer "line_item_id"
    t.integer "service_id"
    t.integer "counter",      :default => 0
    t.integer "lock_version", :default => 0
  end

  add_index "payments", ["line_item_id", "service_id"], :name => "index_payments_on_line_item_id_and_service_id", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "permalink"
  end

end
