module Types
  class QueryType < Types::BaseObject
    field :fetch_users,      resolver: Queries::FetchUsers
    field :fetch_user,       resolver: Queries::FetchUser
    field :fetch_categorias, resolver: Queries::FetchCategorias
    field :fetch_categoria,  resolver: Queries::FetchCategoria
    field :fetch_produtos,   resolver: Queries::FetchProdutos
    field :fetch_produto,    resolver: Queries::FetchProduto
  end
end
