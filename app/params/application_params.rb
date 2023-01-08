# frozen_string_literal: true

class ApplicationParams < Dry::Validation::Contract
  def permit!(params)
    params = self.class.new.call(params)

    raise(invalid_params_error(params)) if params.errors.any?

    params.to_h
  end

  private

  def invalid_params_error(params)
    Exceptions::InvalidParamsError.new(params.errors.to_h, I18n.t('invalid_params'))
  end
end
