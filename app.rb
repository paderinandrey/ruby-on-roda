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
  plugin :error_handler do |e|
    if e.instance_of?(Exceptions::InvalidParamsError)
      error_object = e.object
      response.status = 422
    elsif e.instance_of?(Sequel::ValidationFailed)
      error_object = e.model.errors
      response.status = 422
    else
      error_object = { error: I18n.t('something_went_wrong') }
      response.status = 500
    end

    response.write(error_object.to_json)
  end

  plugin :default_headers,
         'Content-Type' => 'application/json',
         'Strict-Transport-Security' => 'max-age=16070400;',
         'X-Frame-Options' => 'deny',
         'X-Content-Type-Options' => 'nosniff',
         'X-XSS-Protection' => '1; mode=block'

  plugin :all_verbs

  route do |r|
    r.on('api') do
      r.on('v1') do
        r.post('sign_up') do
          sign_up_params = SignUpParams.new.permit!(r.params)
          user = Users::Creator.new(attributes: sign_up_params).call
          tokens = AuthorizationTokensGenerator.new(user:).call

          UserSerializer.new(user:, tokens:).render
        end
      end
    end
  end
end