# frozen_string_literal: true

class User < ApplicationRecord
  include Interface

  enum role: %i[CLIENTE ADMIN BAR CAIXA]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :database_authenticatable, :token_authenticatable

  validates :first_name, :last_name, presence: true
end
