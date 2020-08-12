# frozen_string_literal: true

class ProbeController < ApplicationController
  def probe
    render json: { status: :up }
  end
end
