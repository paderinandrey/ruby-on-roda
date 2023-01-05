# frozen_string_literal: true

class Todo < Sequel::Model
  many_to_one :user

  dataset_module do
    def search_by_name(name)
      where(Sequel.ilike(:name, "%#{name}%"))
    end

    def search_by_description(description)
      where(Sequel.ilike(:description, "%#{description}%"))
    end
  end
end
