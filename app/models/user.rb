class User < ApplicationRecord
  has_secure_password
  has_one :owner

  # Attributes
  enum role: %i[employee admin]
  enum gender: %i[male female other]
  attr_accessor :token

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 8 }, confirmation: true, if: -> { new_record? || !password.nil? }
  validates :password_confirmation, presence: true, if: -> { !password.nil? }
  validates :phone_number, presence: true, format: { with: PHONE_REGEX }, allow_blank: true
  validates :gender, inclusion: { in: genders }
  validates :role, inclusion: { in: roles }

  private
    def self.get_genders
      genders
    end
end

