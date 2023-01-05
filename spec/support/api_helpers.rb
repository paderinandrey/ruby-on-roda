# frozen_string_literal: true

module ApiHelpers
  def response
    last_response
  end

  def json_response
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include ApiHelpers
end
