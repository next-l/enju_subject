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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120406020752) do

  create_table "carrier_types", :force => true do |t|
    t.string   "name",         :null => false
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classification_types", :force => true do |t|
    t.string   "name",         :null => false
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classifications", :force => true do |t|
    t.integer  "parent_id"
    t.string   "category",               :null => false
    t.text     "note"
    t.integer  "classification_type_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lft"
    t.integer  "rgt"
  end

  add_index "classifications", ["category"], :name => "index_classifications_on_category"
  add_index "classifications", ["classification_type_id"], :name => "index_classifications_on_classification_type_id"
  add_index "classifications", ["parent_id"], :name => "index_classifications_on_parent_id"

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "native_name"
    t.text     "display_name"
    t.string   "iso_639_1"
    t.string   "iso_639_2"
    t.string   "iso_639_3"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manifestations", :force => true do |t|
    t.text     "original_title"
    t.text     "title_transcription"
    t.text     "title_alternative"
    t.string   "pub_date"
    t.string   "isbn"
    t.string   "nbn"
    t.string   "ndc"
    t.integer  "carrier_type_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patron_types", :force => true do |t|
    t.string   "name",         :null => false
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patrons", :force => true do |t|
    t.text     "full_name"
    t.text     "full_name_transcription"
    t.integer  "language_id"
    t.integer  "required_role_id"
    t.integer  "patron_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_has_classifications", :force => true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.integer  "classification_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_has_classifications", ["classification_id"], :name => "index_subject_has_classifications_on_classification_id"
  add_index "subject_has_classifications", ["subject_id"], :name => "index_subject_has_classifications_on_subject_id"

  create_table "subject_heading_type_has_subjects", :force => true do |t|
    t.integer  "subject_id",              :null => false
    t.string   "subject_type"
    t.integer  "subject_heading_type_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_heading_type_has_subjects", ["subject_id"], :name => "index_subject_heading_type_has_subjects_on_subject_id"

  create_table "subject_heading_types", :force => true do |t|
    t.string   "name",         :null => false
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_types", :force => true do |t|
    t.string   "name",         :null => false
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "use_term_id"
    t.string   "term"
    t.text     "term_transcription"
    t.integer  "subject_type_id",                   :null => false
    t.text     "scope_note"
    t.text     "note"
    t.integer  "required_role_id",   :default => 1, :null => false
    t.integer  "lock_version",       :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "url"
  end

  add_index "subjects", ["parent_id"], :name => "index_subjects_on_parent_id"
  add_index "subjects", ["required_role_id"], :name => "index_subjects_on_required_role_id"
  add_index "subjects", ["subject_type_id"], :name => "index_subjects_on_subject_type_id"
  add_index "subjects", ["term"], :name => "index_subjects_on_term"
  add_index "subjects", ["use_term_id"], :name => "index_subjects_on_use_term_id"

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_has_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "user_group_id"
    t.integer  "required_role_id"
    t.string   "username"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "work_has_subjects", :force => true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.integer  "work_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_has_subjects", ["subject_id"], :name => "index_work_has_subjects_on_subject_id"
  add_index "work_has_subjects", ["work_id"], :name => "index_work_has_subjects_on_work_id"

end
