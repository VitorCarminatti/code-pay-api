# frozen_string_literal: true

module Mutations
  class UpdateUser < Mutations::BaseMutation
    graphql_name "UpdateUser"

    argument :authentication_token, String, required: true
    argument :role,                 String, required: true

    field :user, Types::UserType, null: false

    def resolve(args)
      user = User.find_by(authentication_token: args[:authentication_token])

      user.update(args.to_h)

      MutationResult.call(
        obj: { user: user },
        success: user.persisted?,
        errors: user.errors
      )
    rescue ActiveRecord::RecordInvalid => invalid
      GraphQL::ExecutionError.new(
        "Invalid Attributes for #{invalid.record.class.name}: " \
        "#{invalid.record.errors.full_messages.join(', ')}"
      )
    end
  end
end