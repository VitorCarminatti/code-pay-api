# frozen_string_literal: true

module Mutations
  class CashIn < Mutations::BaseMutation
    graphql_name "CashIn"

    argument :token, String, required: true
    argument :valor, String, required: true

    def resolve(args)
      user = User.find_by(authentication_token: args[:token])

      if user.present?
        user.update(saldo: user.saldo + args[:valor].to_f)

        MutationResult.call(success: true)
      else
        MutationResult.call(success: false, errors: ["Usuário não existe"])
      end
    end
  end
end