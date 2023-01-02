# frozen_string_literal: true

Application.boot(:bcrypt) do
  init do
    require 'bcrypt'
  end

  start do
    BCrypt::Engine.cost = 1 if Application.env == 'test'
  end
end
