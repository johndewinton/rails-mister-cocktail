class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end


  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    if @cocktail.save
       redirect_to cocktail_path(@cocktail)
    else
       render :new
    end

  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredients, :doses)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
