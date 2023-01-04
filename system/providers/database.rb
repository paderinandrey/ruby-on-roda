# frozen_string_literal: true

Container.register_provider(:database) do
  prepare { require 'sequel/core' }

  start do
    target_container.start :settings
    target_container.start :logger

    database = Sequel.connect(target[:settings].database_url)
    database.loggers << target[:logger]

    register('persistance.db', database)
  end
end
