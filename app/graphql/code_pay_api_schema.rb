class CodePayApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  def self.resolve_type(_type, obj, _ctx)
    "Types::#{obj.class.name}Type".constantize
  rescue NameError
    raise("Unexpected object: #{obj}")
  end

  def self.id_from_object(object, type_definition, _ctx = nil)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  def self.object_from_id(id, _ctx)
    type_name, object_id = GraphQL::Schema::UniqueWithinType.decode(id)

    Object.const_get(type_name).find(object_id)
  end
end
