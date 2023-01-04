# frozen_string_literal: true

require 'dry/system/provider_sources'

Container.register_provider(:settings, from: :dry_system) do
  before :prepare do
    require_relative '../../lib/core/types'
  end

  settings do
    setting :database_url, constructor: Core::Types::String.constrained(filled: true)
  end
end
