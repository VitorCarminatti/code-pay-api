# frozen_string_literal: true

module Mutations
  class CashOut < Mutations::BaseMutation
    graphql_name "CashOut"

    argument :token, String, required: true
    argument :valor, String, required: true

    def resolve(args)
      user = User.find_by(authentication_token: args[:token])

      if user.present?
        if user.saldo < args[:valor].to_f
          MutationResult.call(success: false, errors: ["Saldo insuficiente"])
        else
          user.update(saldo: user.saldo - args[:valor].to_f)
          MutationResult.call(success: true)
        end
      else
        MutationResult.call(success: false, errors: ["Usuário não existe"])
      end
    end
  end
end