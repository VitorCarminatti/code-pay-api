class Compra < ApplicationRecord
  has_one :user
  has_one :produto

  validates :user, :produto, presence: true
end
