# frozen_string_literal: true

Container.register_provider(:logger) do
  prepare { require 'logger' }

  start do
    logger = Logger.new($stdout)

    logger.level = Logger::WARN if Container.env == 'test'

    register(:logger, logger)
  end
end
