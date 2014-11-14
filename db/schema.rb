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

ActiveRecord::Schema.define(version: 20141114071255) do

  create_table "applicant_users", force: true do |t|
    t.string   "mail"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applicants", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "mail"
    t.integer  "phone"
    t.text     "information"
    t.text     "background"
    t.text     "heardof"
    t.integer  "position_id_1"
    t.integer  "position_id_2"
    t.integer  "position_id_3"
    t.integer  "status",                default: 0
    t.text     "comment"
    t.string   "interview_place_1"
    t.string   "interview_place_2"
    t.string   "interview_place_3"
    t.datetime "interview_time_1"
    t.datetime "interview_time_2"
    t.datetime "interview_time_3"
    t.integer  "interviewer_id_1_1"
    t.integer  "interviewer_id_1_2"
    t.integer  "interviewer_id_2_1"
    t.integer  "interviewer_id_2_2"
    t.integer  "interviewer_id_3_1"
    t.integer  "interviewer_id_3_2"
    t.boolean  "deleted",               default: false
    t.string   "username"
    t.string   "password"
    t.string   "dn"
    t.boolean  "has_account",           default: false
    t.integer  "is_notified",           default: 0
    t.string   "birthyear"
    t.string   "place_of_study"
    t.integer  "applicant_user_id"
    t.boolean  "locked"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recruited_position_id"
  end

  create_table "festivals", id: false, force: true do |t|
    t.integer "id",   default: 0, null: false
    t.integer "year"
  end

  create_table "groups", id: false, force: true do |t|
    t.integer "id",                          default: 0, null: false
    t.string  "name_en"
    t.string  "name_no"
    t.integer "section_id"
    t.integer "festival_id"
    t.string  "email",          limit: 1000
    t.string  "tag",                                     null: false
    t.text    "description_en"
    t.text    "description_no"
  end

  create_table "groups_positions", id: false, force: true do |t|
    t.integer "group_id"
    t.integer "position_id"
  end

  create_table "parliaments", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "years_work_lost"
    t.string   "place_of_study"
    t.string   "remember_date"
    t.string   "why_attend"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "why_ip_relevant"
    t.string   "what_study"
    t.string   "how_hear_about_day"
    t.integer  "how_corrupt"
    t.integer  "had_cimilar_experience"
    t.integer  "how_corrupt_tgi"
  end

  create_table "positions", id: false, force: true do |t|
    t.integer  "id",             default: 0, null: false
    t.string   "title_en"
    t.string   "title_no"
    t.integer  "user_id"
    t.text     "description_en"
    t.text     "description_no"
    t.string   "group_dn"
    t.integer  "admission_id"
    t.integer  "group_id"
    t.integer  "number",         default: 1, null: false
    t.datetime "publish_from"
    t.datetime "publish_to"
  end

  create_table "positions_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "position_id", null: false
  end

  create_table "roles", id: false, force: true do |t|
    t.integer  "id",         default: 0, null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer  "role_id",    null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", id: false, force: true do |t|
    t.integer "id",                          default: 0, null: false
    t.string  "name_en"
    t.string  "name_no"
    t.integer "festival_id"
    t.string  "email",          limit: 1000
    t.string  "tag",                                     null: false
    t.text    "description_en"
    t.text    "description_no"
  end

  create_table "users", id: false, force: true do |t|
    t.integer  "id",                                     default: 0, null: false
    t.string   "given_name"
    t.string   "family_name"
    t.date     "date_of_birth"
    t.integer  "gender"
    t.string   "phone"
    t.string   "address"
    t.integer  "postal_code"
    t.integer  "country_id"
    t.string   "next_of_kin_name"
    t.string   "next_of_kin_tlf"
    t.text     "tasks"
    t.string   "study"
    t.integer  "study_place_id"
    t.string   "private_email"
    t.integer  "cardnumber_ntnu"
    t.integer  "cardnumber_samfundet"
    t.string   "city"
    t.string   "username"
    t.integer  "ldap_id"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.integer  "has_skies"
    t.integer  "shoe_size"
    t.integer  "have_group_card"
    t.text     "media_contacts"
    t.string   "local_paper"
    t.integer  "vegetarian",                   limit: 1
    t.integer  "lactose_allergy",              limit: 1
    t.integer  "gluten_allergy",               limit: 1
    t.integer  "nut_allergy",                  limit: 1
    t.integer  "fruit_allergy",                limit: 1
    t.text     "other_allergy"
    t.integer  "no_allergy",                   limit: 1
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_username"
    t.string   "facebook_id"
    t.string   "facebook_token"
    t.string   "google_apps_username"
  end

end
