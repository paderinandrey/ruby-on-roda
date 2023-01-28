# frozen_string_literal: true

class TokensSerializer < ApplicationSerializer
  def to_json
    {
      tokens: @tokens
    }
  end
end
