# frozen_string_literal: true

class TodosSerializer < ApplicationSerializer
  def to_json
    { todos: }
  end

  private

  def todos
    @todos.map do |todo|
      TodoSerializer.new(todo:).to_json
    end
  end
end
