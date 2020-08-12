# frozen_string_literal: true

require 'iam'

class Crew
  attr_accessor :id, :username, :first_name, :last_name, :email, :company_id, :phone, :rate, :price

  def self.fetch(token, id:)
    iam = IAM.new(token)
    response = iam.user(id: id)
    raise response.parsed_response['exception'] if response.code != 200

    raise "User not found with ID #{id}" if response.parsed_response.nil?

    new(response.parsed_response)
  end

  def initialize(json)
    @id = json['id']
    @username = json['username']
    @first_name = json['firstName']
    @last_name = json['lastName']
    @email = json['email']
    @company_id = json.dig('attributes', 'company', 0)
    @phone = json.dig('attributes', 'phone', 0)
    @rate = json.dig('attributes', 'rate', 0)
    @price = json.dig('attributes', 'price', 0)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def shifts
    Shift.where(company_id: company_id, crew_id: id)
  end
end
