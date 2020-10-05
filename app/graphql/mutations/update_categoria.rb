# frozen_string_literal: true

module Mutations
  class UpdateCategoria < Mutations::BaseMutation
    graphql_name "UpdateCategoria"

    argument :id,        ID,     required: true
    argument :descricao, String, required: true

    field :categoria, Types::CategoriaType, null: false

    def resolve(args)
      categoria = Categoria.find(args[:id])

      categoria.update(args.to_h)

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