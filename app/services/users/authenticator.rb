# frozen_string_literal: true

module Users
  class Authenticator
    def initialize(email:, password:)
      @email = email
      @password = password
    end

    def call
      user = User.find(email: @email)

      return user if user&.authenticate(@password)

      raise(Exceptions::InvalidEmailOrPassword)
    end
  end
end
