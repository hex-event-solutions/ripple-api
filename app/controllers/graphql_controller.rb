# frozen_string_literal: true

class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]

    company_id = nil
    if request.env['keycloak.user_groups'].nil?
      company_id = params[:company_id] if params.include? :company_id
    else
      company_id = request.env['keycloak.user_groups'].first.split('/')[1]
      ripple_admin = request.env['keycloak.user_groups'].include? '/ripple-admins'
    end

    context = {
      company_id: company_id,
      ripple_admin: ripple_admin,
      user_roles: request.env['keycloak.user_roles']
    }

    result = AssetmanagementSchema.execute(
      query,
      variables: variables,
      context: context,
      operation_name: operation_name
    )
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(error)
    message = error.message
    backtrace = error.backtrace

    logger.error message
    logger.error backtrace.join("\n")

    render json: { errors: [{ message: message, backtrace: backtrace }], data: {} }, status: 500
  end

  # def invalid_foreign_key(err)
  #   puts 'in rescue block!'
  #   table = err.message.match(/on table \\"([a-z_].+)\\"\\n/)&.captures&.first

  #   not_found_msg = 'This object is still referenced, but the referenced table could not be identified'
  #   raise GraphQL::ExecutionError, not_found_msg if table.nil?

  #   qualifier = %w[a e i o u].include? table[0].downcase ? 'an' : 'a'

  #   raise GraphQL::ExecutionError, "This object is still referenced by #{qualifier} #{table.humanize.titleize}"
  # end
end
