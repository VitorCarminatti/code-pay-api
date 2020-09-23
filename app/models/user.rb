class User < ApplicationRecord
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { message: "já cadastrado" } 
  validate :password_match

  enum role: %i[CLIENTE ADMIN CAIXA BAR]

  private

  def password_match
    self.errors[:senhas] << "não coincidem" if password != password_confirmation
  end
end
