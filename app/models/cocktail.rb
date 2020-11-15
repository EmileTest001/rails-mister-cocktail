class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  # 13.11.2020 Rails Day 5 Cloudinary configuration
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true

  # 15.11.2020 with "search a cocktail" feature
  def self.search(search)
    if search
      # Cocktail.where("name LIKE ?", "%#{search}%").order(name: :asc) => WHERE (name LIKE '%rails%')
      # @persons = People.where("persons.name LIKE concat('%', ?, '%')", params[:search])
      Cocktail.where("LOWER(name) LIKE concat('%', LOWER(?), '%')", search).order(name: :asc)
    else
      Cocktail.all
    end
  end
end
