# frozen_string_literal: true

Application.boot(:logger) do
  init { require "logger" }

  start do
    logger = Logger.new($stdout)

    logger.level = Logger::WARN if Application.env == "test"

    register(:logger, logger)
  end
end
