module Types
  class UserType < Types::BaseObject
    field :id,                    ID,     null: false
    field :name,                  String, null: false
    field :email,                 String, null: false
    field :password,              String, null: false
    field :password_confirmation, String, null: false
    field :role,                  String, null: true
  end
end
