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

ActiveRecord::Schema.define(:version => 20120125223701) do

  create_table "kit_components", :force => true do |t|
    t.integer  "parts_kit_id"
    t.integer  "part_id"
    t.integer  "part_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "jameco_pn"
    t.integer  "quantity"
    t.integer  "nominal_quantity"
    t.integer  "single_cost"
    t.integer  "lot_cost"
    t.integer  "lot_size"
    t.integer  "student_price"
    t.boolean  "deprecated",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts_kits", :force => true do |t|
    t.string   "name"
    t.integer  "kit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "transaction_parts", :force => true do |t|
    t.integer  "transaction_id"
    t.integer  "part_id"
    t.integer  "part_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_price"
  end

  add_index "transaction_parts", ["transaction_id", "part_id"], :name => "index_transaction_parts_on_transaction_id_and_part_id", :unique => true

  create_table "transactions", :force => true do |t|
    t.string   "student_email"
    t.integer  "transaction_total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sale_completed",    :default => false
  end

end
