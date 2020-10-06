class Categoria < ApplicationRecord
  has_many :produtos, dependent: :destroy
  
  validates :descricao, presence: true
end
