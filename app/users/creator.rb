# frozen_string_literal: true

module Users
  class Creator
    def initialize(attributes:)
      @attributes = attributes
    end

    def call
      User.create(
        email: @attributes[:email],
        password: @attributes[:password],
        password_confirmation: @attributes[:password_confirmation],
        authentication_token:
      )
    end

    private

    def authentication_token
      AuthenticationTokenGenerator.call
    end
  end
end
