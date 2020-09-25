# frozen_string_literal: true

module Mutations
  class SignIn < Mutations::BaseMutation
    graphql_name "SignIn"

    argument :email,    String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true

    def resolve(args)
      user = User.find_for_database_authentication(email: args[:email])

      if user.present?
        if user.valid_password?(args[:password])
          context[:current_user] = user
          MutationResult.call(obj: { user: user }, success: true)
        else
          MutationResult.call(success: false, errors: ["Email ou senha inválidos"])
        end
      else
        GraphQL::ExecutionError.new("Usuário não existe")
      end
    end
  end
end