# frozen_string_literal: true

module Todos
  class Updater
    def initialize(todo:, attributes:)
      @todo = todo
      @attributes = attributes
    end

    def call
      @todo.update(
        name: @attributes[:name],
        description: @attributes[:description]
      )
    end
  end
end
