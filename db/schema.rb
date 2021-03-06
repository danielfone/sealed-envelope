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

ActiveRecord::Schema.define(version: 20150903001810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "envelopes", force: :cascade do |t|
    t.uuid     "uuid",            default: "uuid_generate_v4()"
    t.json     "data"
    t.text     "contents"
    t.string   "name"
    t.string   "owner_email",                                    null: false
    t.string   "password_digest",                                null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "envelopes", ["uuid"], name: "index_envelopes_on_uuid", unique: true, using: :btree

  create_table "seals", force: :cascade do |t|
    t.uuid     "uuid",        default: "uuid_generate_v4()"
    t.integer  "envelope_id"
    t.string   "name",                                       null: false
    t.string   "token"
    t.boolean  "sealed",      default: true,                 null: false
    t.datetime "opened_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "seals", ["envelope_id"], name: "index_seals_on_envelope_id", using: :btree
  add_index "seals", ["uuid"], name: "index_seals_on_uuid", unique: true, using: :btree

  add_foreign_key "seals", "envelopes"
end
