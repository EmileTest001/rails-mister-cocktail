class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    # @cocktails = Cocktail.all
    # 15.11.2020 with "search a cocktail" feature
    @cocktails = Cocktail.search(params[:search])
  end

  def show
    # inutile avec l'appel de #before_action
    # @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture_url, :photo, :search)
  end
end
