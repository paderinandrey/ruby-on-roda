# frozen_string_literal: true

Application.boot(:models) do
  init do
    require 'sequel/model'
  end

  start do
    Sequel::Model.cache_associations = false if Application.env == 'development'

    Sequel::Model.plugin(:auto_validations)
    Sequel::Model.plugin(:validation_helpers)
    Sequel::Model.plugin(:prepared_statements)
    Sequel::Model.plugin(:subclasses) unless Application.env == 'development'
    Sequel::Model.plugin(:timestamps)

    Sequel.extension(:named_timezones)

    Sequel.default_timezone = :utc

    Sequel::Model.freeze_descendents unless Application.env == 'development'
  end
end
