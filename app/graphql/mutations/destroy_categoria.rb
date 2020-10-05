# frozen_string_literal: true

module Mutations
  class DestroyCategoria < Mutations::BaseMutation
    graphql_name "DestroyCategoria"

    argument :id, ID, required: true

    def resolve(args)
      Categoria.find(args[:id]).destroy

      MutationResult.call(
        success: true,
        errors: nil
      )
    end
  end
end