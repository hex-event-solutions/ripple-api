# frozen_string_literal: true

class WebsiteController < ApplicationController
  def template
    render plain: company.website.template, content_type: 'text/yaml'
  end

  def component
    name = params.permit(:name)[:name]
    render plain: company.website.website_components.find_by!(name: name).template, content_type: 'text/html'
  end

  def styles
    render plain: company.website.styles, content_type: 'text/css'
  end

  private

  def company
    # @company ||= Company.find_by!(domain: host)
    @company ||= Company.find_by!(domain: 'hexes.co.uk')
  end

  def host
    request.headers['referer'].match(%r{https?://([a-z0-9\-.]*)[:/]})[1]
  end
end
