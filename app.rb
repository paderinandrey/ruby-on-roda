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
    elsif e.instance_of?(ActiveSupport::MessageVerifier::InvalidSignature)
      error_object = { error: I18n.t('invalid_authorization_token') }
      response.status = 401
    elsif e.instance_of?(Exceptions::InvalidEmailOrPassword)
      error_object = { error: I18n.t('invalid_email_or_password') }
      response.status = 401
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

  def current_user
    return @current_user if @current_user

    purpose = request.url.include?('refresh_token') ? :refresh_token : :access_token
    @current_user = AuthorizationTokenValidator.new(
      authorization_token: env['HTTP_AUTHORIZATION'],
      purpose:
    ).call
  end

  route do |r|
    r.on('api') do
      r.on('v1') do
        r.post('sign_up') do
          sign_up_params = SignUpParams.new.permit!(r.params)
          user = Users::Creator.new(attributes: sign_up_params).call
          tokens = AuthorizationTokensGenerator.new(user:).call

          UserSerializer.new(user:, tokens:).render
        end

        r.post('login') do
          login_params = LoginParams.new.permit!(r.params)
          user = Users::Authenticator.new(email: login_params[:email], password: login_params[:password]).call
          tokens = AuthorizationTokensGenerator.new(user:).call

          UserSerializer.new(user:, tokens:).render
        end

        r.delete('logout') do
          Users::UpdateAuthenticationToken.new(user: current_user).call

          response.write(nil)
        end

        r.post('refresh_token') do
          Users::UpdateAuthenticationToken.new(user: current_user).call
          tokens = AuthorizationTokensGenerator.new(user: current_user).call

          TokensSerializer.new(tokens:).render
        end

        r.on('todos') do
          current_user

          r.get do
            todos_params = TodosParams.new.permit!(r.params)
            todos = TodosQuery.new(dataset: current_user.todos_dataset, params: todos_params).call
            TodosSerializer.new(todos:).render
          end
        end
      end
    end
  end
end
