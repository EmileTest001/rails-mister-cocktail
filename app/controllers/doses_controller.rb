class DosesController < ApplicationController
  def destroy
    @dose  = Dose.find(params[:id])
    # @cocktail = @dose.cocktail
    @dose.destroy

    # redirect_to cocktail_path(@cocktail)
    # plus court
    redirect_to cocktail_path(@dose.cocktail)
  end

  def new
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
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
