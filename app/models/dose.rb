class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  # validates :cocktail_id, :ingredient_id
  # validates_uniqueness_of :cocktail_id, :ingredient_id
  validates :ingredient_id, uniqueness: { scope: :cocktail_id }
end
