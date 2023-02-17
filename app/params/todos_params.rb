# frozen_string_literal: true

class TodosParams < ApplicationParams
  params do
    optional(:search_by_name).value(:string)
    optional(:search_by_description).value(:string)
    optional(:sort).value(included_in?: Constants::TODO_SORT_COLUMNS)
    optional(:direction).value(included_in?: Constants::SORT_DIRECTIONS)
  end
end
