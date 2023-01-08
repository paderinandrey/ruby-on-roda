# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  def to_json
    {
      user:,
      tokens: @tokens
    }
  end

  private

  def user
    {
      id: @user.id,
      email: @user.email,
      created_at: @user.created_at,
      updated_at: @user.updated_at
    }
  end
end
