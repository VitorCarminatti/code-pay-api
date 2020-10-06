class Produto < ApplicationRecord
  belongs_to :categoria

  validates :nome, :preco, presence: true
end
