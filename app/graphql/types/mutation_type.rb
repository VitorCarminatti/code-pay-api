# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :register_user,     mutation: Mutations::RegisterUser
    field :update_user,       mutation: Mutations::UpdateUser
    field :sign_in,           mutation: Mutations::SignIn
    field :sign_out,          mutation: Mutations::SignOut

    field :cash_in,           mutation: Mutations::CashIn
    field :cash_out,          mutation: Mutations::CashOut
    
    field :create_categoria,  mutation: Mutations::CreateCategoria
    field :update_categoria,  mutation: Mutations::UpdateCategoria
    field :destroy_categoria, mutation: Mutations::DestroyCategoria
    
    field :create_produto,    mutation: Mutations::CreateProduto
    field :update_produto,    mutation: Mutations::UpdateProduto
    field :destroy_produto,   mutation: Mutations::DestroyProduto
  end
end