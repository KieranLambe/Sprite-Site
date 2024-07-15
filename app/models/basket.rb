class Basket < ApplicationRecord
  has_many :basket_items, dependent: :destroy
  has_many :items, through: :basket_items
  attribute :token, :string

  before_create :generate_token

  private

  def generate_token
    self.token ||= SecureRandom.hex(10)
  end
end