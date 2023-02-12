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

ActiveRecord::Schema[7.0].define(version: 2022_09_06_065509) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "account_number"
    t.string "bank_name"
    t.string "swift_number"
    t.string "bank_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "loan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_chatrooms_on_loan_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.float "amount"
    t.string "status"
    t.string "deposit_reference"
    t.bigint "wallet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bank_account_id", null: false
    t.index ["bank_account_id"], name: "index_deposits_on_bank_account_id"
    t.index ["wallet_id"], name: "index_deposits_on_wallet_id"
  end

  create_table "loan_payments", force: :cascade do |t|
    t.bigint "loan_id", null: false
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "payment_date"
    t.string "payment_status"
    t.date "due_date"
    t.bigint "transfer_id"
    t.float "profit"
    t.index ["loan_id"], name: "index_loan_payments_on_loan_id"
    t.index ["transfer_id"], name: "index_loan_payments_on_transfer_id"
  end

  create_table "loan_requests", force: :cascade do |t|
    t.float "amount"
    t.string "title"
    t.text "description"
    t.string "loan_category"
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "loan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "accepted_at"
    t.date "declined_at"
    t.index ["loan_id"], name: "index_loan_requests_on_loan_id"
    t.index ["user_id"], name: "index_loan_requests_on_user_id"
  end

  create_table "loans", force: :cascade do |t|
    t.float "amount"
    t.float "interest_rate"
    t.string "loan_category"
    t.boolean "instant_loan"
    t.string "status"
    t.integer "payback_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_frequency"
    t.date "loan_start_date"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.float "amount"
    t.string "status"
    t.string "transfer_type"
    t.bigint "loan_id"
    t.bigint "wallet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_transfers_on_loan_id"
    t.index ["wallet_id"], name: "index_transfers_on_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "profession"
    t.string "address"
    t.string "phone"
    t.string "user_image"
    t.string "id_image"
    t.string "id_number"
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  create_table "withdrawal_requests", force: :cascade do |t|
    t.bigint "wallet_id", null: false
    t.float "amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bank_account_id", null: false
    t.index ["bank_account_id"], name: "index_withdrawal_requests_on_bank_account_id"
    t.index ["wallet_id"], name: "index_withdrawal_requests_on_wallet_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bank_accounts", "users"
  add_foreign_key "chatrooms", "loans"
  add_foreign_key "deposits", "bank_accounts"
  add_foreign_key "deposits", "wallets"
  add_foreign_key "loan_payments", "loans"
  add_foreign_key "loan_payments", "transfers"
  add_foreign_key "loan_requests", "loans"
  add_foreign_key "loan_requests", "users"
  add_foreign_key "loans", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "transfers", "loans"
  add_foreign_key "transfers", "wallets"
  add_foreign_key "wallets", "users"
  add_foreign_key "withdrawal_requests", "bank_accounts"
  add_foreign_key "withdrawal_requests", "wallets"
end
