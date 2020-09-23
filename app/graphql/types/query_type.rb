module Types
  class QueryType < Types::BaseObject
    field :fetch_users, resolver: Queries::FetchUsers
    field :fetch_user,  resolver: Queries::FetchUser
  end
end
