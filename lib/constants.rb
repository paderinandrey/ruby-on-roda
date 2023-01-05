# frozen_string_literal: true

module Constants
  EMAIL_REGEX = /^[^,;@\r\n]+@[^,@;\r\n]+\.[^,@;\r\n]+$/
  public_constant :EMAIL_REGEX

  SORT_DIRECTIONS = %w[desc asc].freeze
  public_constant :SORT_DIRECTIONS

  TODO_SORT_COLUMNS = %w[name description created_at updated_at].freeze
  public_constant :TODO_SORT_COLUMNS

  UUID_REGEX = /(\h{8}(?:-\h{4}){3}-\h{12})/
  public_constant :UUID_REGEX
end
