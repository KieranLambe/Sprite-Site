class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :item

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end