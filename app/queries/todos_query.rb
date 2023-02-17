# frozen_string_literal: true

class TodosQuery
  def initialize(dataset:, params:)
    @dataset = dataset
    @params = params
  end

  def call
    scoped = @dataset
    scoped = scoped.search_by_name(@params[:search_by_name]) if @params[:search_by_name]
    scoped = scoped.search_by_description(@params[:search_by_description]) if @params[:search_by_description]
    scoped = scoped.order(Sequel.public_send(direction, sort))
    scoped.all
  end

  private

  def sort
    (@params[:sort] || :created_at).to_sym
  end

  def direction
    @params[:direction] || :desc
  end
end
