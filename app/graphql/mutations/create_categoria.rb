# frozen_string_literal: true

module Mutations
  class CreateCategoria < Mutations::BaseMutation
    graphql_name "CreateCategoria"

    argument :descricao, String, required: true

    field :categoria, Types::CategoriaType, null: false

    def resolve(args)
      categoria = Categoria.create!(args)

      MutationResult.call(
        obj: { categoria: categoria },
        success: categoria.persisted?,
        errors: categoria.errors
      )
    rescue ActiveRecord::RecordInvalid => invalid
      GraphQL::ExecutionError.new(
        "Invalid Attributes for #{invalid.record.class.name}: " \
        "#{invalid.record.errors.full_messages.join(', ')}"
      )
    end
  end
end