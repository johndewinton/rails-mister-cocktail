class DosesController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to cocktails_path
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    c = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(c)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
