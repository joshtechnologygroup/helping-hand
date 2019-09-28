# frozen_string_literal: true

module Render
  extend ActiveSupport::Concern
end

def render_bad_request(payload)
  render json: payload, status: :bad_request
end

def render_invalid_token
  render json: { error: (I18n.t 'invalid_token') }, status: :unauthorized
end

def render_serialized_data(payload, options = {})
  render json: serialize_model(payload, options), status: :ok
end

def render_serialized_list(payload, options = {})
  render json: serialize_models(payload, options), status: :ok
end

def render_success(payload)
  render json: payload, status: :ok
end

def render_unauthenticated
  render json: { error: (I18n.t 'unauthenticated') }, status: :unauthorized
end

def render_unauthorized
  message = I18n.t 'unauthorized'
  render json: { error: message }, status: :forbidden
end

def render_not_found
  render json: { error: (I18n.t 'not_found') }, status: :not_found
end
