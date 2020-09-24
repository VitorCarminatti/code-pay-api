# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    object_class Types::BaseObject
    field_class Types::BaseField
    input_object_class Types::BaseInputObject

    field :success, Boolean, null: false
    field :errors, [String], null: true

    protected

    def authorize_user
      return true if context[:current_user].present?

      raise GraphQL::ExecutionError, "User not signed in"
    end
  end
end