# frozen_string_literal: true

class LoginParams < ApplicationParams
  params do
    required(:email).filled(:string).value(format?: Constants::EMAIL_REGEX)
    required(:password).filled(:string)
  end
end
