class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  # 13.11.2020 Rails Day 5 Cloudinary configuration
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true
end
