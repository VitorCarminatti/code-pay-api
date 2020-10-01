module Queries
  class FetchCategorias < Queries::BaseQuery
    type [Types::CategoriaType], null: false

    def resolve
      Categoria.all
    end
  end
end