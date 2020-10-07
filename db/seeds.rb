# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).

tmpl_header = Setting.create!(name: 'Document header')
tmpl_footer = Setting.create!(name: 'Document footer')
tmpl_styles = Setting.create!(name: 'Document styles')
asset_barcode = Setting.create!(name: 'Asset barcode pattern')
asset_case_barcode = Setting.create!(name: 'Asset case barcode pattern')
Setting.create!(name: 'Language - Event')
Setting.create!(name: 'Language - Asset')
Setting.create!(name: 'Language - Client')
