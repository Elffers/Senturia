class OperasController < ApplicationController
  def new
    @opera = Opera.new
    @operas = Opera.all
    @composers = Composer.alphabetize_array
  end

  def create
    @opera = Opera.new(opera_params)
    if @opera.save
      redirect_to root_path
    else
      render :add_rep
    end
  end

  def edit
    @opera = Opera.find(params[:id])
    @composers = Composer.alphabetize_array
  end

  def update
    @opera = Opera.find(params[:id])
    if @opera.update(opera_params)
      redirect_to root_path
    else
      render :add_rep
    end
  end

  def delete
    @opera = Opera.find(params[:id])
    @opera.destroy
    redirect_to root_path
  end

  private

  def opera_params
    params.require(:opera).permit(:name, :notes, :composer_id, :composer_name)
  end

end
