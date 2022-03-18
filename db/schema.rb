# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_11_160628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "github"
    t.string "p_key"
    t.integer "owner"
    t.string "pub_key"
    t.string "wallet"
    t.decimal "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["github"], name: "index_companies_on_github", unique: true
    t.index ["name"], name: "index_companies_on_name", unique: true
    t.index ["p_key"], name: "index_companies_on_p_key", unique: true
    t.index ["pub_key"], name: "index_companies_on_pub_key", unique: true
    t.index ["wallet"], name: "index_companies_on_wallet", unique: true
  end

  create_table "contributions", force: :cascade do |t|
    t.string "pull_request"
    t.string "job_type"
    t.boolean "accepted", default: false
    t.decimal "balance"
    t.integer "creator"
    t.decimal "vote_balance"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_contributions_on_company_id"
  end

  create_table "user_companies", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_user_companies_on_company_id"
    t.index ["user_id"], name: "index_user_companies_on_user_id"
  end

  create_table "user_contributions", force: :cascade do |t|
    t.bigint "contribution_id"
    t.bigint "user_id"
    t.decimal "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contribution_id"], name: "index_user_contributions_on_contribution_id"
    t.index ["user_id"], name: "index_user_contributions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "wallet"
    t.string "p_key"
    t.string "pub_key"
    t.string "job"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["p_key"], name: "index_users_on_p_key", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["wallet"], name: "index_users_on_wallet", unique: true
  end

  add_foreign_key "contributions", "companies"
  add_foreign_key "user_companies", "companies"
  add_foreign_key "user_companies", "users"
  add_foreign_key "user_contributions", "contributions"
  add_foreign_key "user_contributions", "users"
end
