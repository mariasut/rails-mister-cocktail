class DosesController < ApplicationController

  def new
    @cocktail= Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end


  def create
    @cocktail= Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      puts "Failed"
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to dose_path
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
