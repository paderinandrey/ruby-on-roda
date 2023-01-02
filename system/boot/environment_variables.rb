# frozen_string_literal: true

Application.boot(:environment_variables) do
  start do
    env = Application.env

    if %w[development test].include?(env)
      require "dotenv"

      Dotenv.load(".env", ".env.#{env}")
    end
  end
end
