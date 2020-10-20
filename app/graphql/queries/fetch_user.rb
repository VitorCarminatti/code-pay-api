module Queries
  class FetchUser < Queries::BaseQuery
    type Types::UserType, null: false
    argument :token, String, required: true

    def resolve(token:)
      User.find_by(authentication_token: token)
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new('Usuário não existe')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(
        "Atributos inválidos para #{e.record.class}: " + 
        "#{e.record.errors.full_messages.join(', ')}"
      )
    end
  end
end