module Types
  class CategoriaType < Types::BaseObject
    field :id,         ID,                              null: false
    field :descricao,  String,                          null: false
    field :produtos,   [Types::ProdutoType],            null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
