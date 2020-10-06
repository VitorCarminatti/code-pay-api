# frozen_string_literal: true

module Mutations
  class CreateProduto < Mutations::BaseMutation
    graphql_name "CreateProduto"

    argument :nome,         String, required: true
    argument :preco,        String,  required: true
    argument :categoria_id, ID,     required: true

    field :produto, Types::ProdutoType, null: false

    def resolve(args)
      produto = Produto.create!(args)

      MutationResult.call(
        obj: { produto: produto },
        success: produto.persisted?,
        errors: produto.errors
      )
    rescue ActiveRecord::RecordInvalid => invalid
      GraphQL::ExecutionError.new(
        "Invalid Attributes for #{invalid.record.class.name}: " \
        "#{invalid.record.errors.full_messages.join(', ')}"
      )
    end
  end
end