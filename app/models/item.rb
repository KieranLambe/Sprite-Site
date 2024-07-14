class Item < ApplicationRecord
  has_many :basket_items
  has_many :baskets, through: :basket_items
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :star_rating, inclusion: { in: 1..5 }
end