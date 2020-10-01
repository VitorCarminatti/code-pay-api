module Queries
  class FetchCategoria < Queries::BaseQuery
    type Types::CategoriaType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Categoria.find(id)
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new('Categoria não existe')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(
        "Atributos inválidos para #{e.record.class}: " + 
        "#{e.record.errors.full_messages.join(', ')}"
      )
    end
  end
end