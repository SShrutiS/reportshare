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

ActiveRecord::Schema.define(version: 20170919212836) do

  create_table "SALES_TREND", id: false, force: :cascade do |t|
    t.date "SLS_PROC_WRK_DT"
    t.varchar "YR_MNTH", limit: 6
    t.varchar "PROGRAM", limit: 15
    t.char "COMPANY_CODE", limit: 4, null: false
    t.decimal "WAC", precision: 38, scale: 2
    t.decimal "SF", precision: 38, scale: 2
    t.decimal "SSF", precision: 38, scale: 2
    t.decimal "SDC", precision: 38, scale: 2
    t.decimal "QTY", precision: 38, scale: 2
    t.decimal "SALES", precision: 38, scale: 2
    t.varchar "SOURCE", limit: 9, null: false
  end

  create_table "SALES_TXN", id: false, force: :cascade do |t|
    t.decimal "sls_id", precision: 10, scale: 0, null: false
    t.decimal "sls_id_seq_num", precision: 5, scale: 0, null: false
    t.decimal "sls_qty", precision: 17, scale: 0
    t.decimal "sls_amt", precision: 19, scale: 4
  end

  create_table "sales_summaries", force: :cascade do |t|
    t.string "sls_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sl_quarantines", force: :cascade do |t|
    t.string "gcn", null: false
    t.integer "year_month", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
