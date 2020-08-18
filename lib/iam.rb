# frozen_string_literal: true

require 'httparty'

class IAM
  include HTTParty

  attr_accessor :token

  def initialize(token)
    @token = token
  end

  def user(id:)
    authed_get("user/#{id}")
  end

  def users
    authed_get('users')
  end

  private

  def iam_host
    ENV.fetch('IAM_HOST')
  end

  def authed_get(path)
    self.class.get("#{iam_host}/#{path}", {
                     headers: {
                       'Authorization' => "Bearer #{@token}"
                     }
                   })
  end
end
