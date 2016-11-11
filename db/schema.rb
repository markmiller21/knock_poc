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

ActiveRecord::Schema.define(version: 20161111005435) do

  create_table "meetings", force: :cascade do |t|
    t.integer  "knockee_id"
    t.integer  "knocker_id"
    t.string   "meeting_type"
    t.datetime "meeting_time"
    t.float    "meeting_price"
    t.integer  "status"
    t.string   "reject_reasons"
    t.string   "reschedule_time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "meeting_location"
    t.index ["knockee_id"], name: "index_meetings_on_knockee_id"
    t.index ["knocker_id"], name: "index_meetings_on_knocker_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "knocker_id"
    t.integer  "knockee_id"
    t.integer  "status"
    t.string   "description"
    t.float    "duration"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["knockee_id"], name: "index_transactions_on_knockee_id"
    t.index ["knocker_id"], name: "index_transactions_on_knocker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "student_status"
    t.string   "activities"
    t.string   "personal_description"
    t.float    "philanthropy_percent"
    t.string   "cell_phone"
    t.string   "highschool"
    t.string   "major"
    t.float    "phone_call_price"
    t.string   "avaliability"
    t.float    "meeting_price"
    t.float    "video_price"
    t.string   "venmo"
    t.string   "avatar_path"
    t.string   "resume_path"
    t.string   "common_essay_path"
    t.string   "college_essay_path"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "college"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
