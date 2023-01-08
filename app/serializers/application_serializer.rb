# frozen_string_literal: true

class ApplicationSerializer
  def initialize(object)
    object.each_pair do |key, value|
      instance_variable_set(:"@#{key}", value)
    end
  end

  def render
    Oj.dump(to_json)
  end
end
