# frozen_string_literal: true

class Event < ApplicationRecord
  include Documents

  template_values(
    date_start: '2020-07-30 09:00:00',
    date_end: '2020-08-06 17:00:00',
    date_out: '2020-07-29 09:00:00',
    date_return: '2020-08-07 17:00:00',
    description: 'Template event description. Write a quick summary here.',
    details: 'Template event details. Use this area to describe more about the event.',
    location: 'Template location'
  )

  has_many :event_items, dependent: :destroy
  has_many :asset_types, through: :event_items, source: :item, source_type: 'AssetType'
  has_many :assets, through: :event_items, source: :item, source_type: 'Asset'
  has_many :row_items, through: :event_items, source: :item, source_type: 'RowItem'
  has_many :shifts, dependent: :destroy

  belongs_to :company
  belongs_to :client

  validates :company, :client, :date_start, :date_end, :date_out, :date_return, :description, :location, presence: true
  validate :dates_are_possible?
  validate :date_span

  default_scope { includes(:event_items) }

  mustache(
    date_start: ->(v) { v.strftime('%d-%m-%Y %H:%M') },
    date_end: ->(v) { v.strftime('%d-%m-%Y %H:%M') },
    date_out: ->(v) { v.strftime('%d-%m-%Y %H:%M') },
    date_return: ->(v) { v.strftime('%d-%m-%Y %H:%M') },
    items: ->(v) { v },
    grand_total: ->(v) { v },
    asset_types_total_value: ->(v) { v },
    company: ->(v) { v },
    client: ->(v) { v }
  )

  def dates_are_possible?
    current_order = [date_out, date_start, date_end, date_return]
    if current_order.none?(&:nil?)
      sorted_order = current_order.sort
      return if current_order == sorted_order
    end

    errors.add(:dates, 'Date out <= Date start <= Date end <= Date return')
  end

  def date_span
    maximum_end = date_out + 3.months

    errors.add(:dates, 'An event must span less than 3 calendar months') if date_return > maximum_end
  end

  def items
    @items ||= event_items.where.not(item_type: 'Asset').map do |ei|
      item = ei.item.formatted_hash(ei)
      item[:discount] = item_discount(ei.discount)
      subtotal = item_subtotal(ei, date_start, date_end)
      item[:subtotal] = currency(subtotal)
      item[:raw_subtotal] = subtotal
      item
    end
  end

  # def bare_items
  #   return @bare_items if @bare_items

  #   all_items = (items + items.map { |item| item[:accessories] || [] }).flatten

  #   all_items = all_items.map do |item|
  #     {
  #       name: item[:name],
  #       quantity: item[:quantity]
  #     }
  #   end

  #   all_items = all_items.sort_by { |item| item[:name] }.inject([]) do |memo, item|
  #     if memo.last.nil?
  #       [item]
  #     elsif memo.last[:name] == item[:name]
  #       memo.last[:quantity] += item[:quantity]
  #       memo
  #     else
  #       memo << item
  #     end
  #   end

  #   @bare_items = all_items
  #   @bare_items
  # end

  def item_discount(discount)
    percentage(display_discount(calculate_discount(discount)))
  end

  def item_subtotal(event_item, date_start, date_end)
    price = event_item.item.duration_price(date_start: date_start, date_end: date_end)
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

  def total_value
    @total_value ||= items.map { |i| i[:raw_subtotal] }.reduce(&:+) || 0
  end

  def grand_total
    currency(total_value)
  end

  def asset_types_total_value
    cost_with_accessories = event_items.where(item_type: 'AssetType').map do |at|
      (at.item&.cost_with_accessories || 0) * at.quantity
    end
    currency(cost_with_accessories.reduce(&:+) || 0)
  end
end
