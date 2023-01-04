# frozen_string_literal: true

Container.register_provider(:models) do
  prepare do
    require 'sequel/model'
  end

  start do
    Sequel::Model.cache_associations = false if Container.env == 'development'

    Sequel::Model.plugin(:auto_validations)
    Sequel::Model.plugin(:validation_helpers)
    Sequel::Model.plugin(:prepared_statements)
    Sequel::Model.plugin(:subclasses) unless Container.env == 'development'
    Sequel::Model.plugin(:timestamps)

    Sequel.extension(:named_timezones)

    Sequel.default_timezone = :utc

    Sequel::Model.freeze_descendents unless Container.env == 'development'
  end
end
