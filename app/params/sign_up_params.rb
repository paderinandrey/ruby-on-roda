# frozen_string_literal: true

class SignUpParams < ApplicationParams
  params do
    required(:email).filled(:string).value(format?: Constants::EMAIL_REGEX)
    required(:password).filled(:string)
    required(:password_confirmation).filled(:string)
  end
end
