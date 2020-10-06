# frozen_string_literal: true

module Mutations
  class DestroyProduto < Mutations::BaseMutation
    graphql_name "DestroyProduto"

    argument :id, ID, required: true

    def resolve(args)
      Produto.find(args[:id]).destroy

      MutationResult.call(
        success: true,
        errors: nil
      )
    end
  end
end