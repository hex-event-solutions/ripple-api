# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_716_142_717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'accessories', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'asset_type_id', null: false
    t.integer 'accessory_asset_type_id'
    t.decimal 'quantity'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_accessories_on_asset_type_id'
    t.index ['company_id'], name: 'index_accessories_on_company_id'
  end

  create_table 'active_storage_attachments', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.uuid 'record_id', null: false
    t.uuid 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'asset_cases', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'barcode'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_asset_cases_on_company_id'
  end

  create_table 'asset_type_categories', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'asset_type_id', null: false
    t.uuid 'category_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_asset_type_categories_on_asset_type_id'
    t.index ['category_id'], name: 'index_asset_type_categories_on_category_id'
    t.index ['company_id'], name: 'index_asset_type_categories_on_company_id'
  end

  create_table 'asset_type_multiplier_types', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'asset_type_id', null: false
    t.uuid 'multiplier_type_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_asset_type_multiplier_types_on_asset_type_id'
    t.index ['company_id'], name: 'index_asset_type_multiplier_types_on_company_id'
    t.index ['multiplier_type_id'], name: 'index_asset_type_multiplier_types_on_multiplier_type_id'
  end

  create_table 'asset_type_specifications', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'asset_type_id', null: false
    t.uuid 'specification_id', null: false
    t.string 'value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_asset_type_specifications_on_asset_type_id'
    t.index ['company_id'], name: 'index_asset_type_specifications_on_company_id'
    t.index ['specification_id'], name: 'index_asset_type_specifications_on_specification_id'
  end

  create_table 'asset_types', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.decimal 'cost'
    t.decimal 'rate'
    t.boolean 'display_on_website'
    t.string 'manufacturer'
    t.string 'model'
    t.decimal 'weight'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_asset_types_on_company_id'
  end

  create_table 'assets', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'asset_type_id', null: false
    t.string 'barcode'
    t.uuid 'asset_case_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_case_id'], name: 'index_assets_on_asset_case_id'
    t.index ['asset_type_id'], name: 'index_assets_on_asset_type_id'
    t.index ['company_id'], name: 'index_assets_on_company_id'
  end

  create_table 'categories', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'name'
    t.string 'fullname'
    t.uuid 'parent_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_categories_on_company_id'
    t.index ['parent_id'], name: 'index_categories_on_parent_id'
  end

  create_table 'client_types', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_client_types_on_company_id'
  end

  create_table 'clients', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'organisation_name'
    t.string 'address1'
    t.string 'address2'
    t.string 'address3'
    t.string 'city'
    t.string 'county'
    t.string 'postcode'
    t.uuid 'client_type_id', null: false
    t.integer 'discount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_type_id'], name: 'index_clients_on_client_type_id'
    t.index ['company_id'], name: 'index_clients_on_company_id'
  end

  create_table 'companies', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.string 'vat_number'
    t.string 'company_number'
    t.string 'address1'
    t.string 'address2'
    t.string 'address3'
    t.string 'city'
    t.string 'county'
    t.string 'postcode'
    t.string 'phone_number'
    t.string 'logo'
    t.string 'domain'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'contacts', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'client_id', null: false
    t.string 'name'
    t.string 'email'
    t.string 'phone'
    t.text 'details'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_contacts_on_client_id'
    t.index ['company_id'], name: 'index_contacts_on_company_id'
  end

  create_table 'crews', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'name'
    t.string 'email'
    t.decimal 'rate'
    t.decimal 'price'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_crews_on_company_id'
  end

  create_table 'document_items', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'document_id', null: false
    t.string 'item_type', null: false
    t.uuid 'item_id', null: false
    t.decimal 'quantity'
    t.integer 'discount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_document_items_on_company_id'
    t.index ['document_id'], name: 'index_document_items_on_document_id'
    t.index %w[item_type item_id], name: 'index_document_items_on_item_type_and_item_id'
  end

  create_table 'document_state_events', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'document_state_id', null: false
    t.uuid 'document_id', null: false
    t.string 'details'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_document_state_events_on_company_id'
    t.index ['document_id'], name: 'index_document_state_events_on_document_id'
    t.index ['document_state_id'], name: 'index_document_state_events_on_document_state_id'
  end

  create_table 'document_states', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_document_states_on_company_id'
  end

  create_table 'document_type_fields', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'name'
    t.string 'property'
    t.uuid 'document_type_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_document_type_fields_on_company_id'
    t.index ['document_type_id'], name: 'index_document_type_fields_on_document_type_id'
  end

  create_table 'document_types', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'template'
    t.string 'styles'
    t.string 'name'
    t.string 'subject'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_document_types_on_company_id'
  end

  create_table 'documents', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'document_type_id', null: false
    t.string 'number'
    t.string 'subject_id'
    t.datetime 'date_issued'
    t.datetime 'date_due'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_documents_on_company_id'
    t.index ['document_type_id'], name: 'index_documents_on_document_type_id'
  end

  create_table 'event_items', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'event_id', null: false
    t.string 'item_type', null: false
    t.uuid 'item_id', null: false
    t.decimal 'quantity'
    t.integer 'discount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_event_items_on_company_id'
    t.index ['event_id'], name: 'index_event_items_on_event_id'
    t.index %w[item_type item_id], name: 'index_event_items_on_item_type_and_item_id'
  end

  create_table 'events', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.datetime 'date_start'
    t.datetime 'date_end'
    t.datetime 'date_out'
    t.datetime 'date_return'
    t.uuid 'client_id', null: false
    t.string 'description'
    t.text 'details'
    t.text 'location'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_events_on_client_id'
    t.index ['company_id'], name: 'index_events_on_company_id'
  end

  create_table 'images', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'alt'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_images_on_company_id'
  end

  create_table 'maintenance_events', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'maintenance_schedule_id', null: false
    t.uuid 'asset_id', null: false
    t.text 'details'
    t.uuid 'maintenance_resolution_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_id'], name: 'index_maintenance_events_on_asset_id'
    t.index ['company_id'], name: 'index_maintenance_events_on_company_id'
    t.index ['maintenance_resolution_id'], name: 'index_maintenance_events_on_maintenance_resolution_id'
    t.index ['maintenance_schedule_id'], name: 'index_maintenance_events_on_maintenance_schedule_id'
  end

  create_table 'maintenance_resolutions', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_maintenance_resolutions_on_company_id'
  end

  create_table 'maintenance_schedules', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'asset_type_id', null: false
    t.uuid 'maintenance_type_id', null: false
    t.text 'details'
    t.integer 'repeat_multiplier'
    t.string 'repeat_period'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_maintenance_schedules_on_asset_type_id'
    t.index ['company_id'], name: 'index_maintenance_schedules_on_company_id'
    t.index ['maintenance_type_id'], name: 'index_maintenance_schedules_on_maintenance_type_id'
  end

  create_table 'maintenance_types', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_maintenance_types_on_company_id'
  end

  create_table 'multiplier_types', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'name'
    t.integer 'multiplier'
    t.string 'multiplier_type'
    t.integer 'operand_quantity'
    t.string 'operand_type'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_multiplier_types_on_company_id'
  end

  create_table 'resource_images', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'image_id', null: false
    t.string 'resource_type', null: false
    t.uuid 'resource_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_resource_images_on_company_id'
    t.index ['image_id'], name: 'index_resource_images_on_image_id'
    t.index %w[resource_type resource_id], name: 'index_resource_images_on_resource_type_and_resource_id'
  end

  create_table 'row_items', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.decimal 'price'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_row_items_on_company_id'
  end

  create_table 'shifts', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'crew_id', null: false
    t.uuid 'event_id', null: false
    t.datetime 'start'
    t.datetime 'finish'
    t.decimal 'rate'
    t.decimal 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_shifts_on_company_id'
    t.index ['crew_id'], name: 'index_shifts_on_crew_id'
    t.index ['event_id'], name: 'index_shifts_on_event_id'
  end

  create_table 'specifications', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['company_id'], name: 'index_specifications_on_company_id'
  end

  add_foreign_key 'accessories', 'asset_types'
  add_foreign_key 'accessories', 'companies'
  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'asset_cases', 'companies'
  add_foreign_key 'asset_type_categories', 'asset_types'
  add_foreign_key 'asset_type_categories', 'categories'
  add_foreign_key 'asset_type_categories', 'companies'
  add_foreign_key 'asset_type_multiplier_types', 'asset_types'
  add_foreign_key 'asset_type_multiplier_types', 'companies'
  add_foreign_key 'asset_type_multiplier_types', 'multiplier_types'
  add_foreign_key 'asset_type_specifications', 'asset_types'
  add_foreign_key 'asset_type_specifications', 'companies'
  add_foreign_key 'asset_type_specifications', 'specifications'
  add_foreign_key 'asset_types', 'companies'
  add_foreign_key 'assets', 'asset_cases'
  add_foreign_key 'assets', 'asset_types'
  add_foreign_key 'assets', 'companies'
  add_foreign_key 'categories', 'companies'
  add_foreign_key 'client_types', 'companies'
  add_foreign_key 'clients', 'client_types'
  add_foreign_key 'clients', 'companies'
  add_foreign_key 'contacts', 'clients'
  add_foreign_key 'contacts', 'companies'
  add_foreign_key 'crews', 'companies'
  add_foreign_key 'document_items', 'companies'
  add_foreign_key 'document_state_events', 'companies'
  add_foreign_key 'document_state_events', 'document_states'
  add_foreign_key 'document_state_events', 'documents'
  add_foreign_key 'document_states', 'companies'
  add_foreign_key 'document_type_fields', 'companies'
  add_foreign_key 'document_type_fields', 'document_types'
  add_foreign_key 'document_types', 'companies'
  add_foreign_key 'documents', 'companies'
  add_foreign_key 'documents', 'document_types'
  add_foreign_key 'event_items', 'companies'
  add_foreign_key 'events', 'clients'
  add_foreign_key 'events', 'companies'
  add_foreign_key 'images', 'companies'
  add_foreign_key 'maintenance_events', 'assets'
  add_foreign_key 'maintenance_events', 'companies'
  add_foreign_key 'maintenance_events', 'maintenance_resolutions'
  add_foreign_key 'maintenance_events', 'maintenance_schedules'
  add_foreign_key 'maintenance_resolutions', 'companies'
  add_foreign_key 'maintenance_schedules', 'asset_types'
  add_foreign_key 'maintenance_schedules', 'companies'
  add_foreign_key 'maintenance_schedules', 'maintenance_types'
  add_foreign_key 'maintenance_types', 'companies'
  add_foreign_key 'multiplier_types', 'companies'
  add_foreign_key 'resource_images', 'companies'
  add_foreign_key 'row_items', 'companies'
  add_foreign_key 'shifts', 'companies'
  add_foreign_key 'shifts', 'crews'
  add_foreign_key 'shifts', 'events'
  add_foreign_key 'specifications', 'companies'
end
