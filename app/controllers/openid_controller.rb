# frozen_string_literal: true

class OpenidController < ApplicationController
  def callback
    pp params
  end

  def token; end
end
