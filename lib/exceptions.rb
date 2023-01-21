# frozen_string_literal: true

module Exceptions
  class InvalidParamsError < StandardError
    attr_reader :object

    def initialize(object, message)
      @object = object

      super(message)
    end
  end

  class InvalidEmailOrPassword < StandardError
  end
end
