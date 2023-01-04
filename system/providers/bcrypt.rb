# frozen_string_literal: true

Container.register_provider(:bcrypt) do
  prepare do
    require 'bcrypt'
  end

  start do
    BCrypt::Engine.cost = 1 if Container.test?
  end
end
