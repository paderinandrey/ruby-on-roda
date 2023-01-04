# frozen_string_literal: true

Container.register_provider(:database) do |container|
  prepare { require 'sequel/core' }

  start do
    use :settings
    use :logger

    database = Sequel.connect(target[:settings].database_url)
    database.loggers << target[:logger]

    container.register('persistance.db', database)
  end
end
