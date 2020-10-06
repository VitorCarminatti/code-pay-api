module Queries
  class FetchProdutos < Queries::BaseQuery
    type [Types::ProdutoType], null: false

    def resolve
      Produto.all
    end
  end
end