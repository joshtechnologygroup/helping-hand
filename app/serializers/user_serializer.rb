# frozen_string_literal: true

class UserSerializer < BaseSerializer
  attribute :email
  attribute :first_name
  attribute :last_name
  attribute :gender
  attribute :phone_number
  attribute :token
end
