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

ActiveRecord::Schema.define(version: 7) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "late_plates", force: :cascade do |t|
    t.date     "day",                             null: false
    t.boolean  "completed",       default: false, null: false
    t.integer  "meal_id",                         null: false
    t.integer  "user_id",                         null: false
    t.integer  "organization_id",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["day"], name: "index_late_plates_on_day", using: :btree
    t.index ["meal_id"], name: "index_late_plates_on_meal_id", using: :btree
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name",            null: false
    t.time     "time",            null: false
    t.integer  "organization_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["name"], name: "index_meals_on_name", unique: true, using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "full_name",            null: false
    t.string   "abbreviation",         null: false
    t.string   "school",               null: false
    t.string   "address",              null: false
    t.integer  "organization_manager"
    t.integer  "user_manager"
    t.integer  "kitchen_manager"
    t.integer  "house_manager"
    t.integer  "service_manager"
    t.integer  "scholarship_manager"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["full_name"], name: "index_organizations_on_full_name", unique: true, using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "label",       null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["label"], name: "index_roles_on_label", unique: true, using: :btree
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                              null: false
    t.string   "last_name",                               null: false
    t.string   "phone_number"
    t.boolean  "enabled",                 default: false, null: false
    t.string   "email_address",                           null: false
    t.string   "provider",                                null: false
    t.string   "uid",                                     null: false
    t.string   "oauth_token",                             null: false
    t.datetime "oauth_expires_at",                        null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "affiliated_organization"
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  end

  add_foreign_key "late_plates", "meals", name: "fk_late_plate_meal"
  add_foreign_key "late_plates", "organizations", name: "fk_late_plate_organization_id"
  add_foreign_key "late_plates", "users", name: "fk_late_plate_requester"
  add_foreign_key "meals", "organizations", name: "fk_meals_organization_id"
  add_foreign_key "organizations", "users", column: "house_manager", name: "fk_house_manager"
  add_foreign_key "organizations", "users", column: "kitchen_manager", name: "fk_kitchen_manager"
  add_foreign_key "organizations", "users", column: "organization_manager", name: "fk_organization_manager"
  add_foreign_key "organizations", "users", column: "scholarship_manager", name: "fk_scholarship_manager"
  add_foreign_key "organizations", "users", column: "service_manager", name: "fk_service_manager"
  add_foreign_key "organizations", "users", column: "user_manager", name: "fk_user_manager"
  add_foreign_key "user_roles", "roles", name: "fk_user_role_role"
  add_foreign_key "user_roles", "users", name: "fk_user_role_user"
  add_foreign_key "users", "organizations", column: "affiliated_organization", name: "fk_affiliated_organization"
end
