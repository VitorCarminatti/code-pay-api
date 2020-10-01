class Categoria < ApplicationRecord
  validates :descricao, presence: true
end
