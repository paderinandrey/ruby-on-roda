# frozen_string_literal: true

class User < Sequel::Model
  plugin :secure_password

  def validate
    super

    validates_format(Constants::EMAIL_REGEX, :email) if email
  end
end
