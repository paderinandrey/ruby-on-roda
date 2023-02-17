# frozen_string_literal: true

class TodoParams < ApplicationParams
  params do
    required(:name).filled(:string)
    required(:description).filled(:string)
  end
end
