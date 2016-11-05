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

ActiveRecord::Schema.define(version: 20161104221705) do

  create_table "meetings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "knockee_id_id"
    t.integer  "knocker_id_id"
    t.integer  "type"
    t.string   "meeting_time"
    t.float    "meeting_price",   limit: 24
    t.integer  "status"
    t.string   "reject_reasons"
    t.string   "reschedule_time"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["knockee_id_id"], name: "index_meetings_on_knockee_id_id", using: :btree
    t.index ["knocker_id_id"], name: "index_meetings_on_knocker_id_id", using: :btree
  end

  create_table "transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "knocker_id_id"
    t.integer  "knockee_id_id"
    t.integer  "status"
    t.string   "description"
    t.float    "duration",      limit: 24
    t.float    "price",         limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["knockee_id_id"], name: "index_transactions_on_knockee_id_id", using: :btree
    t.index ["knocker_id_id"], name: "index_transactions_on_knocker_id_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "student_status"
    t.string   "activities"
    t.string   "personal_description"
    t.float    "philanthropy_percent",   limit: 24
    t.string   "cell_phone"
    t.string   "school"
    t.string   "major"
    t.float    "phone_call_price",       limit: 24
    t.string   "avaliability"
    t.float    "meeting_price",          limit: 24
    t.float    "video_price",            limit: 24
    t.string   "venmo"
    t.string   "avatar_path"
    t.string   "resume_path"
    t.string   "common_essay_path"
    t.string   "college_essay_path"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
