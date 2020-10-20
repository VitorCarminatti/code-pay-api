# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    graphql_name "User"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :lastName, String, null: false
    delegate :last_name, to: :object

    field :firstName, String, null: false
    delegate :first_name, to: :object

    field :email, String, null: false

    field :role,  String, null: false

    field :saldo, String, null: false

    field :authentication_token, String, null: true
  end
end