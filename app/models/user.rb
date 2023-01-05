# frozen_string_literal: true

class User < Sequel::Model
  plugin :secure_password

  one_to_many :todos

  def validate
    super

    validates_format(Constants::EMAIL_REGEX, :email) if email
  end
end
