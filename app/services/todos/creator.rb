# frozen_string_literal: true

module Todos
  class Creator
    def initialize(user:, attributes:)
      @user = user
      @attributes = attributes
    end

    def call
      Todo.create(
        user: @user,
        name: @attributes[:name],
        description: @attributes[:description]
      )
    end
  end
end
