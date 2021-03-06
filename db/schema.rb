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

ActiveRecord::Schema.define(version: 2018_08_09_124805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "authentication_providers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_authentication_providers_on_name"
  end

  create_table "certifications", force: :cascade do |t|
    t.bigint "profile_id"
    t.string "name", null: false
    t.string "institution", null: false
    t.string "attachment"
    t.date "termination_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution"], name: "index_certifications_on_institution"
    t.index ["name"], name: "index_certifications_on_name"
    t.index ["profile_id"], name: "index_certifications_on_profile_id"
    t.index ["termination_date"], name: "index_certifications_on_termination_date"
  end

  create_table "educations", force: :cascade do |t|
    t.bigint "profile_id"
    t.string "degree", null: false
    t.string "institution", null: false
    t.string "graduating_year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "education_type", null: false
    t.index ["degree"], name: "index_educations_on_degree"
    t.index ["graduating_year"], name: "index_educations_on_graduating_year"
    t.index ["institution"], name: "index_educations_on_institution"
    t.index ["profile_id"], name: "index_educations_on_profile_id"
  end

  create_table "profile_subjects", id: false, force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "subject_id"
    t.index ["profile_id"], name: "index_profile_subjects_on_profile_id"
    t.index ["subject_id"], name: "index_profile_subjects_on_subject_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "gender"
    t.string "phone_number"
    t.text "about_me"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.jsonb "meta"
    t.index ["birthday"], name: "index_profiles_on_birthday"
    t.index ["first_name"], name: "index_profiles_on_first_name"
    t.index ["gender"], name: "index_profiles_on_gender"
    t.index ["last_name"], name: "index_profiles_on_last_name"
    t.index ["phone_number"], name: "index_profiles_on_phone_number"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subjects_on_name"
  end

  create_table "user_authentications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "authentication_provider_id"
    t.string "uid"
    t.string "token"
    t.datetime "token_expires_at"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_provider_id"], name: "index_user_authentications_on_authentication_provider_id"
    t.index ["user_id"], name: "index_user_authentications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_experiences", force: :cascade do |t|
    t.bigint "profile_id"
    t.string "company_name", null: false
    t.string "title", null: false
    t.string "location", null: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "current_workplace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_name"], name: "index_work_experiences_on_company_name"
    t.index ["location"], name: "index_work_experiences_on_location"
    t.index ["profile_id"], name: "index_work_experiences_on_profile_id"
    t.index ["title"], name: "index_work_experiences_on_title"
  end

  add_foreign_key "certifications", "profiles"
  add_foreign_key "educations", "profiles"
  add_foreign_key "profile_subjects", "profiles"
  add_foreign_key "profile_subjects", "subjects"
  add_foreign_key "profiles", "users"
  add_foreign_key "user_authentications", "authentication_providers"
  add_foreign_key "user_authentications", "users"
  add_foreign_key "work_experiences", "profiles"
end
