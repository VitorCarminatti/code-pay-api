# frozen_string_literal: true

module Mutations
  class UpdateProduto < Mutations::BaseMutation
    graphql_name "UpdateProduto"

    argument :id,           ID,     required: true
    argument :nome,         String, required: true
    argument :preco,        String,  required: true
    argument :categoria_id, ID,     required: true

    field :produto, Types::ProdutoType, null: false

    def resolve(args)
      produto = Produto.find(args[:id])

      produto.update(args.to_h)

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