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

ActiveRecord::Schema.define(version: 20_200_601_155_750) do
  create_table 'accessories', force: :cascade do |t|
    t.integer 'asset_type_id', null: false
    t.integer 'accessory_asset_type_id'
    t.decimal 'quantity'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_accessories_on_asset_type_id'
  end

  create_table 'asset_events', force: :cascade do |t|
    t.integer 'asset_id', null: false
    t.integer 'event_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_id'], name: 'index_asset_events_on_asset_id'
    t.index ['event_id'], name: 'index_asset_events_on_event_id'
  end

  create_table 'asset_type_categories', force: :cascade do |t|
    t.integer 'asset_type_id', null: false
    t.integer 'category_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_asset_type_categories_on_asset_type_id'
    t.index ['category_id'], name: 'index_asset_type_categories_on_category_id'
  end

  create_table 'asset_type_events', force: :cascade do |t|
    t.integer 'asset_type_id', null: false
    t.integer 'event_id', null: false
    t.decimal 'quantity'
    t.integer 'discount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_asset_type_events_on_asset_type_id'
    t.index ['event_id'], name: 'index_asset_type_events_on_event_id'
  end

  create_table 'asset_type_specifications', force: :cascade do |t|
    t.integer 'asset_type_id', null: false
    t.integer 'specification_id', null: false
    t.string 'value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_asset_type_specifications_on_asset_type_id'
    t.index ['specification_id'], name: 'index_asset_type_specifications_on_specification_id'
  end

  create_table 'asset_types', force: :cascade do |t|
    t.decimal 'cost'
    t.decimal 'rate'
    t.integer 'multiplier_type_id', null: false
    t.boolean 'display_on_website'
    t.string 'manufacturer'
    t.string 'model'
    t.decimal 'weight'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['multiplier_type_id'], name: 'index_asset_types_on_multiplier_type_id'
  end

  create_table 'assets', force: :cascade do |t|
    t.integer 'asset_type_id', null: false
    t.string 'barcode'
    t.integer 'case_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_assets_on_asset_type_id'
    t.index ['case_id'], name: 'index_assets_on_case_id'
  end

  create_table 'cases', force: :cascade do |t|
    t.string 'barcode'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.integer 'parent_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'client_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'organisation_name'
    t.string 'address1'
    t.string 'address2'
    t.string 'address3'
    t.string 'city'
    t.string 'county'
    t.string 'postcode'
    t.integer 'client_type_id', null: false
    t.integer 'discount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_type_id'], name: 'index_clients_on_client_type_id'
  end

  create_table 'contacts', force: :cascade do |t|
    t.integer 'client_id', null: false
    t.string 'name'
    t.string 'email'
    t.string 'phone'
    t.text 'details'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_contacts_on_client_id'
  end

  create_table 'crew_roles', force: :cascade do |t|
    t.integer 'crew_id', null: false
    t.integer 'role_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['crew_id'], name: 'index_crew_roles_on_crew_id'
    t.index ['role_id'], name: 'index_crew_roles_on_role_id'
  end

  create_table 'crews', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.decimal 'rate'
    t.decimal 'price'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'document_states', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'events', force: :cascade do |t|
    t.datetime 'date_start'
    t.datetime 'date_end'
    t.datetime 'date_out'
    t.datetime 'date_return'
    t.integer 'client_id', null: false
    t.string 'description'
    t.text 'details'
    t.text 'location'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_events_on_client_id'
  end

  create_table 'invoice_items', force: :cascade do |t|
    t.integer 'invoice_id', null: false
    t.integer 'item_id', null: false
    t.integer 'item_type_id', null: false
    t.decimal 'quantity'
    t.integer 'discount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['invoice_id'], name: 'index_invoice_items_on_invoice_id'
    t.index ['item_id'], name: 'index_invoice_items_on_item_id'
    t.index ['item_type_id'], name: 'index_invoice_items_on_item_type_id'
  end

  create_table 'invoices', force: :cascade do |t|
    t.integer 'event_id'
    t.integer 'client_id', null: false
    t.datetime 'date_sent'
    t.datetime 'date_due'
    t.datetime 'date_paid'
    t.integer 'document_state_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_invoices_on_client_id'
    t.index ['document_state_id'], name: 'index_invoices_on_document_state_id'
  end

  create_table 'item_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'items', force: :cascade do |t|
    t.decimal 'price'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'maintenance_events', force: :cascade do |t|
    t.integer 'maintenance_schedule_id', null: false
    t.integer 'asset_id', null: false
    t.text 'details'
    t.integer 'maintenance_resolution_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_id'], name: 'index_maintenance_events_on_asset_id'
    t.index ['maintenance_resolution_id'], name: 'index_maintenance_events_on_maintenance_resolution_id'
    t.index ['maintenance_schedule_id'], name: 'index_maintenance_events_on_maintenance_schedule_id'
  end

  create_table 'maintenance_resolutions', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'maintenance_schedules', force: :cascade do |t|
    t.integer 'asset_type_id', null: false
    t.integer 'maintenance_type_id', null: false
    t.text 'details'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['asset_type_id'], name: 'index_maintenance_schedules_on_asset_type_id'
    t.index ['maintenance_type_id'], name: 'index_maintenance_schedules_on_maintenance_type_id'
  end

  create_table 'maintenance_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'multiplier_types', force: :cascade do |t|
    t.string 'name'
    t.decimal 'multiplier'
    t.string 'operand_type'
    t.decimal 'operand_quantity'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'quote_items', force: :cascade do |t|
    t.integer 'quote_id', null: false
    t.integer 'item_id', null: false
    t.integer 'item_type_id', null: false
    t.decimal 'quantity'
    t.integer 'discount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['item_id'], name: 'index_quote_items_on_item_id'
    t.index ['item_type_id'], name: 'index_quote_items_on_item_type_id'
    t.index ['quote_id'], name: 'index_quote_items_on_quote_id'
  end

  create_table 'quotes', force: :cascade do |t|
    t.integer 'event_id'
    t.integer 'client_id', null: false
    t.datetime 'date_sent'
    t.datetime 'date_expires'
    t.integer 'document_state_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_quotes_on_client_id'
    t.index ['document_state_id'], name: 'index_quotes_on_document_state_id'
  end

  create_table 'role_privileges', force: :cascade do |t|
    t.integer 'role_id', null: false
    t.string 'action'
    t.string 'resource'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['role_id'], name: 'index_role_privileges_on_role_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'shifts', force: :cascade do |t|
    t.integer 'crew_id', null: false
    t.integer 'event_id', null: false
    t.datetime 'start'
    t.datetime 'finish'
    t.decimal 'rate'
    t.decimal 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['crew_id'], name: 'index_shifts_on_crew_id'
    t.index ['event_id'], name: 'index_shifts_on_event_id'
  end

  create_table 'specifications', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'accessories', 'asset_types'
  add_foreign_key 'asset_events', 'assets'
  add_foreign_key 'asset_events', 'events'
  add_foreign_key 'asset_type_categories', 'asset_types'
  add_foreign_key 'asset_type_categories', 'categories'
  add_foreign_key 'asset_type_events', 'asset_types'
  add_foreign_key 'asset_type_events', 'events'
  add_foreign_key 'asset_type_specifications', 'asset_types'
  add_foreign_key 'asset_type_specifications', 'specifications'
  add_foreign_key 'asset_types', 'multiplier_types'
  add_foreign_key 'assets', 'asset_types'
  add_foreign_key 'assets', 'cases'
  add_foreign_key 'clients', 'client_types'
  add_foreign_key 'contacts', 'clients'
  add_foreign_key 'crew_roles', 'crews'
  add_foreign_key 'crew_roles', 'roles'
  add_foreign_key 'events', 'clients'
  add_foreign_key 'invoice_items', 'invoices'
  add_foreign_key 'invoice_items', 'item_types'
  add_foreign_key 'invoice_items', 'items'
  add_foreign_key 'invoices', 'clients'
  add_foreign_key 'invoices', 'document_states'
  add_foreign_key 'maintenance_events', 'assets'
  add_foreign_key 'maintenance_events', 'maintenance_resolutions'
  add_foreign_key 'maintenance_events', 'maintenance_schedules'
  add_foreign_key 'maintenance_schedules', 'asset_types'
  add_foreign_key 'maintenance_schedules', 'maintenance_types'
  add_foreign_key 'quote_items', 'item_types'
  add_foreign_key 'quote_items', 'items'
  add_foreign_key 'quote_items', 'quotes'
  add_foreign_key 'quotes', 'clients'
  add_foreign_key 'quotes', 'document_states'
  add_foreign_key 'role_privileges', 'roles'
  add_foreign_key 'shifts', 'crews'
  add_foreign_key 'shifts', 'events'
end
