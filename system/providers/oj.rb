# frozen_string_literal: true

Container.register_provider(:oj) do
  prepare do
    require 'oj'
  end

  start do
    Oj.default_options = { mode: :compat }
  end
end
