# frozen_string_literal: true

Application.boot(:oj) do
  init do
    require 'oj'
  end

  start do
    Oj.default_options = { mode: :compact }
  end
end
