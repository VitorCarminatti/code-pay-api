module Types
  class ProdutoType < Types::BaseObject
    field :id,           ID,                              null: false
    field :categoria_id, ID,                              null: false
    field :categoria,    Types::CategoriaType,            null: false
    field :nome,         String,                          null: false
    field :preco,        String,                          null: false
    field :created_at,   GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at,   GraphQL::Types::ISO8601DateTime, null: true
  end
end
