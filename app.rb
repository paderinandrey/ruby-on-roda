# frozen_string_literal: true

require 'roda'

require_relative './system/boot'

class App < Roda
  plugin :environments
  plugin :heartbeat

  configure :development, :production do
    plugin :enhanced_logger
  end

  plugin :symbol_matchers
  plugin :error_handler

  plugin :default_headers,
         'Content-Type' => 'application/json',
         'Strict-Transport-Security' => 'max-age=16070400;',
         'X-Frame-Options' => 'deny',
         'X-Content-Type-Options' => 'nosniff',
         'X-XSS-Protection' => '1; mode=block'

  plugin :all_verbs
end
