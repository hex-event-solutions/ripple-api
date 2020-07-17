# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :event_items, dependent: :destroy
  has_many :asset_types, through: :event_items, source: :item, source_type: 'AssetType'
  has_many :assets, through: :event_items, source: :item, source_type: 'Asset'
  has_many :row_items, through: :event_items, source: :item, source_type: 'RowItem'
  has_many :shifts

  belongs_to :company
  belongs_to :client

  validates :company, :client, :date_start, :date_end, :date_out, :date_return, :description, :location, presence: true
  validate :dates_are_possible?

  default_scope { includes(:event_items) }

  def dates_are_possible?
    current_order = [date_start, date_out, date_return, date_end]
    if current_order.none?(&:nil?)
      sorted_order = current_order.sort
      return if current_order == sorted_order
    end

    errors.add(:dates, 'date_start <= date_out <= date_return <= date_end')
  end

  def documents
    DocumentType.joins(:documents).where(subject: 'Event', documents: { subject_id: id })
  end

  def items
    @items ||= event_items.where.not(item_type: 'Asset').map do |ei|
      item = item_hash(ei)
      price = ei.item&.price(date_start: date_start, date_end: date_end)
      item[:unit_price] = currency(price)
      subtotal = item_subtotal(ei, price)
      item[:display_subtotal] = currency(subtotal)
      item[:subtotal] = subtotal
      item
    end
  end

  def item_hash(event_item)
    item = event_item.item.attributes.symbolize_keys
    item[:quantity] = ei.quantity
    item[:discount] = item_discount(ei.discount)
    item
  end

  def item_discount(discount)
    percentage(display_discount(calculate_discount(discount)))
  end

  def item_subtotal(event_item, price)
    calculate_discount(event_item.discount) * price * event_item.quantity
  end

  def client_discount
    @client_discount ||= client.discount
  end

  def calculate_discount(event_item_discount)
    [
      event_item_discount,
      client_discount
    ].map { |d| format_discount(d) }.reduce(&:*)
  end

  def display_discount(value)
    (1 - value) * 100
  end

  def format_discount(value)
    1 - (value / 100.0)
  end

  def grand_total
    currency(items.map { |i| i[:subtotal] }.reduce(&:+))
  end

  def asset_types_total_value
    currency(asset_types.map(&:cost).reduce(&:+))
  end

  def display_date_start
    date_start.strftime('%d-%m-%Y %H:%M')
  end

  def display_date_end
    date_end.strftime('%d-%m-%Y %H:%M')
  end

  def display_date_out
    date_out.strftime('%d-%m-%Y %H:%M')
  end

  def display_date_return
    date_return.strftime('%d-%m-%Y %H:%M')
  end
end
