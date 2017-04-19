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


ActiveRecord::Schema.define(version: 20170413205422) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "subtitle"
    t.string   "author"
    t.string   "location"
    t.string   "flag"
    t.text     "body"
    t.date     "posted_on"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "hero_image_id"
    t.string   "hero_image_filename"
    t.integer  "hero_image_size"
    t.string   "hero_image_content_type"
    t.integer  "views",                   default: 0
  end

  create_table "articles_products", id: false, force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "product_id", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_id",                      null: false
    t.string   "data_filename",                null: false
    t.integer  "data_size"
    t.string   "data_content_type"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "dealers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "zip"
    t.string   "country_id", limit: 2
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "download_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "downloads", force: :cascade do |t|
    t.string   "locale"
    t.string   "title"
    t.string   "part_number"
    t.integer  "download_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
    t.index ["download_type_id"], name: "index_downloads_on_download_type_id", using: :btree
  end

  create_table "downloads_products", id: false, force: :cascade do |t|
    t.integer "download_id", null: false
    t.integer "product_id",  null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "training_event_course_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.index ["training_event_course_id"], name: "index_enrollments_on_training_event_course_id", using: :btree
  end

  create_table "feature_associations", force: :cascade do |t|
    t.integer  "feature_id"
    t.integer  "product_id"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_feature_associations_on_feature_id", using: :btree
    t.index ["product_id"], name: "index_feature_associations_on_product_id", using: :btree
  end

  create_table "features", force: :cascade do |t|
    t.string   "title"
    t.string   "youtube_video_id"
    t.text     "description"
    t.text     "body"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "hero_image_id"
    t.string   "hero_image_filename"
    t.integer  "hero_image_size"
    t.string   "hero_image_content_type"
  end

  create_table "identities", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "legal_policy_documents", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.text     "body"
    t.date     "effective_on"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
  end

  create_table "media_downloads", force: :cascade do |t|
    t.string   "description"
    t.string   "file_id"
    t.string   "file_filename"
    t.string   "file_size"
    t.string   "file_content_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  create_table "patents", force: :cascade do |t|
    t.integer "number"
    t.string  "title"
    t.index ["number"], name: "index_patents_on_number", unique: true, using: :btree
  end

  create_table "patents_products", id: false, force: :cascade do |t|
    t.integer "patent_id",  null: false
    t.integer "product_id", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "prerequisites_training_courses", force: :cascade do |t|
    t.integer "prerequisite_id"
    t.integer "training_course_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.integer  "product_type_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "hero_image_id"
    t.string   "hero_image_filename"
    t.integer  "hero_image_size"
    t.string   "hero_image_content_type"
    t.string   "icon_image_id"
    t.string   "icon_image_filename"
    t.integer  "icon_image_size"
    t.string   "icon_image_content_type"
    t.index ["product_type_id"], name: "index_product_categories_on_product_type_id", using: :btree
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "hero_image_id"
    t.string   "hero_image_filename"
    t.integer  "hero_image_size"
    t.string   "hero_image_content_type"
    t.string   "icon_image_id"
    t.string   "icon_image_filename"
    t.integer  "icon_image_size"
    t.string   "icon_image_content_type"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "part_number"
    t.string   "summary"
    t.text     "description"
    t.date     "expired_on"
    t.integer  "product_category_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "youtube_video_id"
    t.string   "hero_image_id"
    t.string   "hero_image_filename"
    t.integer  "hero_image_size"
    t.string   "hero_image_content_type"
    t.string   "product_image_id"
    t.string   "product_image_filename"
    t.integer  "product_image_size"
    t.string   "product_image_content_type"
    t.index ["product_category_id"], name: "index_products_on_product_category_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "taggings_count"
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "territories", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "office"
    t.string   "dealer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "training_course_products", force: :cascade do |t|
    t.integer "training_course_id"
    t.integer "product_id"
    t.integer "position"
    t.index ["product_id"], name: "index_training_course_products_on_product_id", using: :btree
    t.index ["training_course_id"], name: "index_training_course_products_on_training_course_id", using: :btree
  end

  create_table "training_course_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "number"
    t.integer  "duration"
    t.integer  "training_course_type_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "summary"
    t.index ["training_course_type_id"], name: "index_training_courses_on_training_course_type_id", using: :btree
  end

  create_table "training_event_courses", force: :cascade do |t|
    t.integer  "training_course_id"
    t.integer  "training_event_id"
    t.integer  "seats"
    t.datetime "started_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "room"
    t.datetime "ended_at"
    t.index ["training_course_id"], name: "index_training_event_courses_on_training_course_id", using: :btree
    t.index ["training_event_id"], name: "index_training_event_courses_on_training_event_id", using: :btree
  end

  create_table "training_events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "role"
    t.string   "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "downloads", "download_types"
  add_foreign_key "feature_associations", "features"
  add_foreign_key "feature_associations", "products"
  add_foreign_key "taggings", "tags"
  add_foreign_key "training_course_products", "products"
  add_foreign_key "training_course_products", "training_courses"
end
