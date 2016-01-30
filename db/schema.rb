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

ActiveRecord::Schema.define(version: 20160130081818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "adverts", force: :cascade do |t|
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "adverts", ["user_id"], name: "index_adverts_on_user_id", using: :btree

  create_table "alumnis", force: :cascade do |t|
    t.boolean  "company"
    t.string   "name"
    t.string   "person_in_charge"
    t.string   "contact"
    t.string   "email"
    t.string   "affiliated_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "client_background"
  end

  create_table "clients", force: :cascade do |t|
    t.boolean  "company"
    t.string   "name"
    t.string   "person_in_charge"
    t.string   "contact"
    t.string   "email"
    t.string   "affiliated_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "client_background"
  end

  create_table "events", force: :cascade do |t|
    t.text     "form_params"
    t.text     "link_params"
    t.text     "extra_params"
    t.date     "start_date"
    t.string   "attachment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "events_members", id: false, force: :cascade do |t|
    t.integer "event_id",  null: false
    t.integer "member_id", null: false
  end

  add_index "events_members", ["event_id", "member_id"], name: "index_events_members_on_event_id_and_member_id", using: :btree
  add_index "events_members", ["member_id", "event_id"], name: "index_events_members_on_member_id_and_event_id", using: :btree

  create_table "feedback_from_users", force: :cascade do |t|
    t.text     "feedback"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feedback_from_users", ["user_id"], name: "index_feedback_from_users_on_user_id", using: :btree

  create_table "feedbacks_of_the_services", force: :cascade do |t|
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feedbacks_of_the_services", ["client_id"], name: "index_feedbacks_of_the_services_on_client_id", using: :btree

  create_table "milestone_alumnis", force: :cascade do |t|
    t.text     "content"
    t.boolean  "achieved"
    t.integer  "alumni_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "milestone_alumnis", ["alumni_id"], name: "index_milestone_alumnis_on_alumni_id", using: :btree

  create_table "milestones", force: :cascade do |t|
    t.text     "content"
    t.boolean  "achieved"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "milestones", ["client_id"], name: "index_milestones_on_client_id", using: :btree

  create_table "program_schedules", force: :cascade do |t|
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "program_schedules", ["client_id"], name: "index_program_schedules_on_client_id", using: :btree

  create_table "recommended_services", force: :cascade do |t|
    t.text     "content"
    t.integer  "alumni_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recommended_services", ["alumni_id"], name: "index_recommended_services_on_alumni_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.text     "request_by"
    t.text     "request_for"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "attachment"
  end

  create_table "schedule_for_meetings", force: :cascade do |t|
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedule_for_meetings", ["client_id"], name: "index_schedule_for_meetings_on_client_id", using: :btree

  create_table "services_catereds", force: :cascade do |t|
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "services_catereds", ["client_id"], name: "index_services_catereds_on_client_id", using: :btree

  create_table "sliders", force: :cascade do |t|
    t.string   "slide"
    t.text     "caption"
    t.boolean  "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "inputs"
    t.string   "attachment"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vacancies", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "webinars", force: :cascade do |t|
    t.string   "name"
    t.string   "sessionId"
    t.boolean  "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "adverts", "users"
  add_foreign_key "feedback_from_users", "users"
  add_foreign_key "feedbacks_of_the_services", "clients"
  add_foreign_key "milestone_alumnis", "alumnis"
  add_foreign_key "milestones", "clients"
  add_foreign_key "program_schedules", "clients"
  add_foreign_key "recommended_services", "alumnis"
  add_foreign_key "schedule_for_meetings", "clients"
  add_foreign_key "services_catereds", "clients"
end
