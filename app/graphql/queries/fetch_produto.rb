module Queries
  class FetchProduto < Queries::BaseQuery
    type Types::ProdutoType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Produto.find(id)
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new('Produto não existe')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(
        "Atributos inválidos para #{e.record.class}: " + 
        "#{e.record.errors.full_messages.join(', ')}"
      )
    end
  end
end