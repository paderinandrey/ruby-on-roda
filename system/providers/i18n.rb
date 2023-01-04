# frozen_string_literal: true

Container.register_provider(:i18n) do
  prepare do
    require 'i18n'
  end

  start do
    I18n.load_path << Dir["#{File.expand_path('config/locales')}/*.yml"]
    I18n.config.available_locales = %i[en]
  end
end
