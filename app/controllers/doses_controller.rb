class DosesController < ApplicationController
  def destroy
    @dose  = Dose.find(params[:id])
    # 1. @cocktail = @dose.cocktail
    @dose.destroy

    # 2. redirect_to cocktail_path(@cocktail)
    # plus court ainsi
    redirect_to cocktail_path(@dose.cocktail)
  end

  def new
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    # p "in doses create"
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail


    # 15.11.2020. Handling creation of an new ingredient input by user
    # p params[:ingredient_id] # => nil
    # p params[:ingredient_id].class # => NilClass
    # if params[:ingredient_id].to_s.strip.length >= 1
    #   p "new ingredient"
    #   # new_ingredient = Ingredient.new(params[:ingredient_id]to_s.strip)
    # end


    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
