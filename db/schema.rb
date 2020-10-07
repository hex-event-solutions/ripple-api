# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_16_142750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accessories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "asset_type_id", null: false
    t.uuid "accessory_id", null: false
    t.decimal "quantity"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accessory_id"], name: "index_accessories_on_accessory_id"
    t.index ["asset_type_id"], name: "index_accessories_on_asset_type_id"
    t.index ["company_id"], name: "index_accessories_on_company_id"
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "asset_cases", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "barcode"
    t.integer "barcode_number"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_asset_cases_on_company_id"
  end

  create_table "asset_type_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "asset_type_id", null: false
    t.uuid "category_id", null: false
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_type_id"], name: "index_asset_type_categories_on_asset_type_id"
    t.index ["category_id"], name: "index_asset_type_categories_on_category_id"
    t.index ["company_id"], name: "index_asset_type_categories_on_company_id"
  end

  create_table "asset_type_maintenance_schedules", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "asset_type_id", null: false
    t.uuid "maintenance_schedule_id", null: false
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_type_id"], name: "index_asset_type_maintenance_schedules_on_asset_type_id"
    t.index ["company_id"], name: "index_asset_type_maintenance_schedules_on_company_id"
    t.index ["maintenance_schedule_id"], name: "index_asset_type_maint_schedules_on_maint_schedule_id"
  end

  create_table "asset_type_multiplier_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "asset_type_id", null: false
    t.uuid "multiplier_type_id", null: false
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_type_id"], name: "index_asset_type_multiplier_types_on_asset_type_id"
    t.index ["company_id"], name: "index_asset_type_multiplier_types_on_company_id"
    t.index ["multiplier_type_id"], name: "index_asset_type_multiplier_types_on_multiplier_type_id"
  end

  create_table "asset_type_specifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "asset_type_id", null: false
    t.uuid "specification_id", null: false
    t.string "value"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_type_id"], name: "index_asset_type_specifications_on_asset_type_id"
    t.index ["company_id"], name: "index_asset_type_specifications_on_company_id"
    t.index ["specification_id"], name: "index_asset_type_specifications_on_specification_id"
  end

  create_table "asset_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.decimal "cost"
    t.decimal "rate"
    t.boolean "display_on_website"
    t.string "manufacturer"
    t.string "model"
    t.decimal "weight"
    t.string "description"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_asset_types_on_company_id"
  end

  create_table "assets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "asset_type_id", null: false
    t.uuid "asset_case_id"
    t.string "barcode"
    t.integer "barcode_number"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_case_id"], name: "index_assets_on_asset_case_id"
    t.index ["asset_type_id"], name: "index_assets_on_asset_type_id"
    t.index ["company_id"], name: "index_assets_on_company_id"
  end

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "parent_id"
    t.string "name"
    t.string "fullname"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_categories_on_company_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "client_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "name"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_client_types_on_company_id"
  end

  create_table "clients", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "client_type_id", null: false
    t.string "organisation_name"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "city"
    t.string "county"
    t.string "postcode"
    t.integer "discount"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_type_id"], name: "index_clients_on_client_type_id"
    t.index ["company_id"], name: "index_clients_on_company_id"
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "vat_number"
    t.string "company_number"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "city"
    t.string "county"
    t.string "postcode"
    t.string "phone_number"
    t.string "logo"
    t.string "domain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_settings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "setting_id", null: false
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_settings_on_company_id"
    t.index ["setting_id"], name: "index_company_settings_on_setting_id"
  end

  create_table "contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "client_id", null: false
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_contacts_on_client_id"
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "document_state_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "document_state_id", null: false
    t.uuid "document_id", null: false
    t.string "details"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_document_state_events_on_company_id"
    t.index ["document_id"], name: "index_document_state_events_on_document_id"
    t.index ["document_state_id"], name: "index_document_state_events_on_document_state_id"
  end

  create_table "document_states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "name"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_document_states_on_company_id"
  end

  create_table "document_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "content"
    t.string "header"
    t.string "footer"
    t.string "styles"
    t.string "name"
    t.string "subject"
    t.string "increment_pattern"
    t.integer "increment_start", default: 1
    t.boolean "incremental", default: false, null: false
    t.boolean "date_due", default: false, null: false
    t.boolean "date_issued", default: false, null: false
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_document_types_on_company_id"
  end

  create_table "documents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "document_type_id", null: false
    t.integer "number", default: 0
    t.string "reference"
    t.string "subject_id"
    t.datetime "date_issued"
    t.datetime "date_due"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_documents_on_company_id"
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
  end

  create_table "event_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "event_id", null: false
    t.string "item_type", null: false
    t.uuid "item_id", null: false
    t.decimal "quantity"
    t.integer "discount"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_event_items_on_company_id"
    t.index ["event_id"], name: "index_event_items_on_event_id"
    t.index ["item_type", "item_id"], name: "index_event_items_on_item_type_and_item_id"
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "date_out"
    t.datetime "date_return"
    t.uuid "client_id", null: false
    t.string "description"
    t.text "details"
    t.text "location"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_events_on_client_id"
    t.index ["company_id"], name: "index_events_on_company_id"
  end

  create_table "images", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_images_on_company_id"
  end

  create_table "maintenance_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "maintenance_schedule_id"
    t.uuid "maintenance_type_id"
    t.uuid "asset_id", null: false
    t.uuid "maintenance_resolution_id", null: false
    t.text "details"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_id"], name: "index_maintenance_events_on_asset_id"
    t.index ["company_id"], name: "index_maintenance_events_on_company_id"
    t.index ["maintenance_resolution_id"], name: "index_maintenance_events_on_maintenance_resolution_id"
    t.index ["maintenance_schedule_id"], name: "index_maintenance_events_on_maintenance_schedule_id"
    t.index ["maintenance_type_id"], name: "index_maintenance_events_on_maintenance_type_id"
  end

  create_table "maintenance_resolutions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "name"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_maintenance_resolutions_on_company_id"
  end

  create_table "maintenance_schedules", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "maintenance_type_id", null: false
    t.text "details"
    t.integer "repeat_multiplier"
    t.string "repeat_period"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_maintenance_schedules_on_company_id"
    t.index ["maintenance_type_id"], name: "index_maintenance_schedules_on_maintenance_type_id"
  end

  create_table "maintenance_tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "maintenance_type_task_id", null: false
    t.uuid "maintenance_event_id", null: false
    t.string "result"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_maintenance_tasks_on_company_id"
    t.index ["maintenance_event_id"], name: "index_maintenance_tasks_on_maintenance_event_id"
    t.index ["maintenance_type_task_id"], name: "index_maintenance_tasks_on_maintenance_type_task_id"
  end

  create_table "maintenance_type_task_values", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "maintenance_type_task_id", null: false
    t.string "value"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_maintenance_type_task_values_on_company_id"
    t.index ["maintenance_type_task_id"], name: "index_maintenance_type_task_values_on_maintenance_type_task_id"
  end

  create_table "maintenance_type_tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "maintenance_type_id", null: false
    t.string "name"
    t.string "task_type"
    t.boolean "required"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_maintenance_type_tasks_on_company_id"
    t.index ["maintenance_type_id"], name: "index_maintenance_type_tasks_on_maintenance_type_id"
  end

  create_table "maintenance_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "name"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_maintenance_types_on_company_id"
  end

  create_table "multiplier_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "name"
    t.integer "multiplier"
    t.string "multiplier_type"
    t.integer "operand_quantity"
    t.string "operand_type"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_multiplier_types_on_company_id"
  end

  create_table "resource_images", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "image_id", null: false
    t.string "resource_type", null: false
    t.uuid "resource_id", null: false
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_resource_images_on_company_id"
    t.index ["image_id"], name: "index_resource_images_on_image_id"
    t.index ["resource_type", "resource_id"], name: "index_resource_images_on_resource_type_and_resource_id"
  end

  create_table "row_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.decimal "price"
    t.string "description"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_row_items_on_company_id"
  end

  create_table "settings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shifts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "event_id", null: false
    t.string "crew_id"
    t.datetime "start"
    t.datetime "finish"
    t.decimal "rate"
    t.decimal "price"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_shifts_on_company_id"
    t.index ["event_id"], name: "index_shifts_on_event_id"
  end

  create_table "specifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "name"
    t.boolean "template", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_specifications_on_company_id"
  end

  create_table "website_components", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "website_id", null: false
    t.string "name"
    t.string "component_type"
    t.string "template"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_website_components_on_company_id"
    t.index ["website_id"], name: "index_website_components_on_website_id"
  end

  create_table "websites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.string "template"
    t.string "styles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_websites_on_company_id"
  end

  add_foreign_key "accessories", "asset_types"
  add_foreign_key "accessories", "asset_types", column: "accessory_id"
  add_foreign_key "accessories", "companies"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "asset_cases", "companies"
  add_foreign_key "asset_type_categories", "asset_types"
  add_foreign_key "asset_type_categories", "categories"
  add_foreign_key "asset_type_categories", "companies"
  add_foreign_key "asset_type_maintenance_schedules", "asset_types"
  add_foreign_key "asset_type_maintenance_schedules", "companies"
  add_foreign_key "asset_type_maintenance_schedules", "maintenance_schedules"
  add_foreign_key "asset_type_multiplier_types", "asset_types"
  add_foreign_key "asset_type_multiplier_types", "companies"
  add_foreign_key "asset_type_multiplier_types", "multiplier_types"
  add_foreign_key "asset_type_specifications", "asset_types"
  add_foreign_key "asset_type_specifications", "companies"
  add_foreign_key "asset_type_specifications", "specifications"
  add_foreign_key "asset_types", "companies"
  add_foreign_key "assets", "asset_cases"
  add_foreign_key "assets", "asset_types"
  add_foreign_key "assets", "companies"
  add_foreign_key "categories", "companies"
  add_foreign_key "client_types", "companies"
  add_foreign_key "clients", "client_types"
  add_foreign_key "clients", "companies"
  add_foreign_key "company_settings", "companies"
  add_foreign_key "company_settings", "settings"
  add_foreign_key "contacts", "clients"
  add_foreign_key "contacts", "companies"
  add_foreign_key "document_state_events", "companies"
  add_foreign_key "document_state_events", "document_states"
  add_foreign_key "document_state_events", "documents"
  add_foreign_key "document_states", "companies"
  add_foreign_key "document_types", "companies"
  add_foreign_key "documents", "companies"
  add_foreign_key "documents", "document_types"
  add_foreign_key "event_items", "companies"
  add_foreign_key "events", "clients"
  add_foreign_key "events", "companies"
  add_foreign_key "images", "companies"
  add_foreign_key "maintenance_events", "assets"
  add_foreign_key "maintenance_events", "companies"
  add_foreign_key "maintenance_events", "maintenance_resolutions"
  add_foreign_key "maintenance_events", "maintenance_schedules"
  add_foreign_key "maintenance_events", "maintenance_types"
  add_foreign_key "maintenance_resolutions", "companies"
  add_foreign_key "maintenance_schedules", "companies"
  add_foreign_key "maintenance_schedules", "maintenance_types"
  add_foreign_key "maintenance_tasks", "companies"
  add_foreign_key "maintenance_tasks", "maintenance_events"
  add_foreign_key "maintenance_tasks", "maintenance_type_tasks"
  add_foreign_key "maintenance_type_task_values", "companies"
  add_foreign_key "maintenance_type_task_values", "maintenance_type_tasks"
  add_foreign_key "maintenance_type_tasks", "companies"
  add_foreign_key "maintenance_type_tasks", "maintenance_types"
  add_foreign_key "maintenance_types", "companies"
  add_foreign_key "multiplier_types", "companies"
  add_foreign_key "resource_images", "companies"
  add_foreign_key "row_items", "companies"
  add_foreign_key "shifts", "companies"
  add_foreign_key "shifts", "events"
  add_foreign_key "specifications", "companies"
  add_foreign_key "website_components", "companies"
  add_foreign_key "website_components", "websites"
  add_foreign_key "websites", "companies"
end
