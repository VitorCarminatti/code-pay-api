module Inputs
  class UserInput < Types::BaseInputObject
    argument :name,                  String,  required: true
    argument :email,                 String,  required: true
    argument :password,              String,  required: true
    argument :password_confirmation, String,  required: true
    argument :role,                  Integer, required: false
  end
end