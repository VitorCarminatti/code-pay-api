module Mutations
  class AddUser < Mutations::BaseMutation
    argument :params, Inputs::UserInput, required: true

    field :user, Types::UserType, null: false

    def resolve(params:)
      user_params = Hash params

      begin
        user = User.create!(user_params)

        { user: user }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new(
          "Atributos inválidos para #{e.record.class}: " +
          "#{e.record.errors.full_messages.join(', ')}"
        )
      end
    end
  end
end