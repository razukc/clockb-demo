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

ActiveRecord::Schema.define(version: 20160626125053) do

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

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

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

  create_table "assets", force: :cascade do |t|
    t.string   "storage_uid"
    t.string   "storage_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "storage_width"
    t.integer  "storage_height"
    t.float    "storage_aspect_ratio"
    t.integer  "storage_depth"
    t.string   "storage_format"
    t.string   "storage_mime_type"
    t.string   "storage_size"
  end

  create_table "business_requirements", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "business_requirements", ["user_id"], name: "index_business_requirements_on_user_id", using: :btree

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

  create_table "dashboard_videos", force: :cascade do |t|
    t.string   "embed_code"
    t.integer  "number_of_videos"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "employee_documents", force: :cascade do |t|
    t.string   "name"
    t.text     "attachment"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "files",                   array: true
    t.string   "photo"
  end

  add_index "employee_documents", ["user_id"], name: "index_employee_documents_on_user_id", using: :btree

  create_table "esewa_payments", force: :cascade do |t|
    t.string   "product_id"
    t.string   "reference_id"
    t.float    "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "event_discussions", force: :cascade do |t|
    t.integer  "event_id"
    t.text     "comment"
    t.integer  "in_reply_to", default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.string   "commenter"
  end

  add_index "event_discussions", ["event_id"], name: "index_event_discussions_on_event_id", using: :btree

  create_table "event_sponsor_categories", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_sponsor_categories", ["event_id"], name: "index_event_sponsor_categories_on_event_id", using: :btree

  create_table "event_sponsor_logos", force: :cascade do |t|
    t.integer  "event_sponsor_category_id"
    t.string   "logo"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "event_sponsor_logos", ["event_sponsor_category_id"], name: "index_event_sponsor_logos_on_event_sponsor_category_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.text     "form_params"
    t.text     "link_params"
    t.text     "extra_params"
    t.date     "start_date"
    t.string   "attachment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "attendees_limit"
    t.string   "document"
  end

  create_table "events_members", id: false, force: :cascade do |t|
    t.integer "event_id",  null: false
    t.integer "member_id", null: false
  end

  add_index "events_members", ["event_id", "member_id"], name: "index_events_members_on_event_id_and_member_id", using: :btree
  add_index "events_members", ["member_id", "event_id"], name: "index_events_members_on_member_id_and_event_id", using: :btree

  create_table "events_sliders", force: :cascade do |t|
    t.string   "image"
    t.string   "caption"
    t.boolean  "add_to_site", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "home_page_services_images", force: :cascade do |t|
    t.string "consulting"
    t.string "outsourcing"
    t.string "networking"
    t.string "innovation"
  end

  create_table "invite_freelancers", force: :cascade do |t|
    t.integer  "project_freelancer_id"
    t.integer  "freelancer_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "logo_and_images", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "logo_and_images", ["user_id"], name: "index_logo_and_images_on_user_id", using: :btree

  create_table "main_event_price_and_mileages", force: :cascade do |t|
    t.string   "attendee_category"
    t.string   "price"
    t.string   "mileage"
    t.integer  "event_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "main_event_price_and_mileages", ["event_id"], name: "index_main_event_price_and_mileages_on_event_id", using: :btree

  create_table "main_event_sliders", force: :cascade do |t|
    t.string   "image"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "caption"
  end

  add_index "main_event_sliders", ["event_id"], name: "index_main_event_sliders_on_event_id", using: :btree

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
    t.integer  "user_id"
  end

  add_index "milestones", ["client_id"], name: "index_milestones_on_client_id", using: :btree
  add_index "milestones", ["user_id"], name: "index_milestones_on_user_id", using: :btree

  create_table "networking_requirements", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "networking_requirements", ["user_id"], name: "index_networking_requirements_on_user_id", using: :btree

  create_table "next_event_images", force: :cascade do |t|
    t.string "image"
  end

  create_table "products_and_services", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "products_and_services", ["user_id"], name: "index_products_and_services_on_user_id", using: :btree

  create_table "program_schedules", force: :cascade do |t|
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "program_schedules", ["client_id"], name: "index_program_schedules_on_client_id", using: :btree
  add_index "program_schedules", ["user_id"], name: "index_program_schedules_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "document"
    t.boolean  "public",      default: false
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "deadline"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

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

  create_table "resourcexes", force: :cascade do |t|
    t.string   "category"
    t.text     "meta"
    t.boolean  "add_to_site", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "attach"
    t.string   "image"
  end

  create_table "schedule_for_meetings", force: :cascade do |t|
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "schedule_for_meetings", ["client_id"], name: "index_schedule_for_meetings_on_client_id", using: :btree
  add_index "schedule_for_meetings", ["user_id"], name: "index_schedule_for_meetings_on_user_id", using: :btree

  create_table "services_catereds", force: :cascade do |t|
    t.text     "content"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "services_catereds", ["client_id"], name: "index_services_catereds_on_client_id", using: :btree
  add_index "services_catereds", ["user_id"], name: "index_services_catereds_on_user_id", using: :btree

  create_table "sliders", force: :cascade do |t|
    t.string   "slide"
    t.text     "caption"
    t.boolean  "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_media_links", force: :cascade do |t|
    t.string   "media"
    t.string   "link"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "social_media_links", ["user_id"], name: "index_social_media_links_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.text     "content"
    t.boolean  "status"
    t.string   "schedule"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "usermeetups", force: :cascade do |t|
    t.text     "meta"
    t.integer  "user_x"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "webinar",         default: false
    t.boolean  "meetup",          default: false
    t.boolean  "event",           default: false
    t.boolean  "service_offered", default: false
    t.boolean  "animated_video",  default: false
  end

  add_index "usermeetups", ["user_id"], name: "index_usermeetups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "inputs"
    t.string   "attachment"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "email",                      default: "",    null: false
    t.string   "encrypted_password",         default: ""
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
    t.integer  "invitations_count",          default: 0
    t.string   "photo"
    t.text     "headline_message"
    t.string   "website"
    t.string   "animated_video"
    t.string   "animated_video_file"
    t.boolean  "clock_b_freelancer",         default: false
    t.boolean  "join_as_clock_b_freelancer", default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_websites", force: :cascade do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_websites", ["user_id"], name: "index_users_websites_on_user_id", using: :btree

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
  add_foreign_key "business_requirements", "users"
  add_foreign_key "employee_documents", "users"
  add_foreign_key "event_discussions", "events"
  add_foreign_key "event_sponsor_categories", "events"
  add_foreign_key "event_sponsor_logos", "event_sponsor_categories"
  add_foreign_key "feedback_from_users", "users"
  add_foreign_key "feedbacks_of_the_services", "clients"
  add_foreign_key "logo_and_images", "users"
  add_foreign_key "main_event_price_and_mileages", "events"
  add_foreign_key "main_event_sliders", "events"
  add_foreign_key "milestone_alumnis", "alumnis"
  add_foreign_key "milestones", "clients"
  add_foreign_key "milestones", "users"
  add_foreign_key "networking_requirements", "users"
  add_foreign_key "products_and_services", "users"
  add_foreign_key "program_schedules", "clients"
  add_foreign_key "program_schedules", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "recommended_services", "alumnis"
  add_foreign_key "schedule_for_meetings", "clients"
  add_foreign_key "schedule_for_meetings", "users"
  add_foreign_key "services_catereds", "clients"
  add_foreign_key "services_catereds", "users"
  add_foreign_key "social_media_links", "users"
  add_foreign_key "tasks", "users"
  add_foreign_key "usermeetups", "users"
  add_foreign_key "users_websites", "users"
end
