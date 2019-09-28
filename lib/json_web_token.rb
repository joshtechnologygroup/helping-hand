# frozen_string_literal: true

class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  def self.encode(payload, exp = TOKEN_EXPIRE_TIME.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  rescue JWT::DecodeError => e
    puts e.message
    nil
  end
end
