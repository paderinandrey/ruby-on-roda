# frozen_string_literal: true

class TodoSerializer < ApplicationSerializer
  def to_json
    {
      id: @todo.id,
      name: @todo.name,
      description: @todo.description,
      created_at: @todo.created_at,
      updated_at: @todo.updated_at
    }
  end
end
