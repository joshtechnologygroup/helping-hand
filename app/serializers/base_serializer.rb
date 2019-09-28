# frozen_string_literal: true

require 'jsonapi-serializers'

class BaseSerializer
  include JSONAPI::Serializer

  def self_link
    nil
  end

  def relationship_self_link(_attribute_name)
    nil
  end

  def relationship_related_link(_attribute_name)
    nil
  end

  def serialize_model(model, options = {})
    options[:is_collection] = false
    JSONAPI::Serializer.serialize(model, options)
  end

  def serialize_models(models, options = {})
    options[:is_collection] = true
    JSONAPI::Serializer.serialize(models, options)
  end
end
