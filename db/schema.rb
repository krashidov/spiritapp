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

ActiveRecord::Schema.define(version: 20140912080125) do

  create_table "careplans", force: true do |t|
    t.integer  "organization_id"
    t.integer  "client_id"
    t.integer  "provider_id"
    t.boolean  "relative_care",   default: false, null: false
    t.date     "start_date"
    t.string   "procedure_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "careplans", ["client_id"], name: "index_careplans_on_client_id", using: :btree
  add_index "careplans", ["organization_id"], name: "index_careplans_on_organization_id", using: :btree
  add_index "careplans", ["provider_id"], name: "index_careplans_on_provider_id", using: :btree

  create_table "clients", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "medicaid"
    t.string   "ssi"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "postal_code"
    t.string   "case_manager"
    t.string   "manager_phone"
    t.date     "date_of_birth"
    t.date     "par_expiration"
    t.text     "emergency_contact_info"
    t.string   "hours_plus_travel"
    t.integer  "units",                  default: 0
    t.date     "last_home_visit"
    t.string   "languages"
    t.date     "advanced_directive"
    t.integer  "organization_id"
  end

  add_index "clients", ["organization_id"], name: "index_clients_on_organization_id", using: :btree

  create_table "default_tasks", force: true do |t|
    t.integer  "organization_id"
    t.string   "name",                            null: false
    t.boolean  "homemaking",      default: false, null: false
    t.integer  "value",           default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "default_tasks", ["organization_id"], name: "index_default_tasks_on_organization_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "ssi"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "hours_plus_travel"
    t.date     "date_of_birth"
    t.string   "emergency_contact_info"
    t.integer  "units",                         default: 0
    t.date     "staff_evaluation_date"
    t.date     "safety_training_date"
    t.string   "supervisor"
    t.string   "language"
    t.date     "id_expiration_date"
    t.date     "work_authorization_expiration"
    t.boolean  "active",                        default: true
    t.integer  "organization_id"
  end

  add_index "providers", ["organization_id"], name: "index_providers_on_organization_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "organization_id"
    t.integer  "careplan_id"
    t.integer  "default_task_id"
    t.boolean  "monday",          default: false, null: false
    t.boolean  "tuesday",         default: false, null: false
    t.boolean  "wednesday",       default: false, null: false
    t.boolean  "thursday",        default: false, null: false
    t.boolean  "friday",          default: false, null: false
    t.boolean  "saturday",        default: false, null: false
    t.boolean  "sunday",          default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["careplan_id"], name: "index_tasks_on_careplan_id", using: :btree
  add_index "tasks", ["default_task_id"], name: "index_tasks_on_default_task_id", using: :btree
  add_index "tasks", ["organization_id"], name: "index_tasks_on_organization_id", using: :btree

  create_table "users", force: true do |t|
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
    t.integer  "organization_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
