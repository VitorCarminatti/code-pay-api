Rails.application.routes.draw do
  devise_for :users, skip: :sessions

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute'
  end
  post "/graphql", to: "graphql#execute"
end
