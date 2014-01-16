class OperasController < ApplicationController
  def new
    @opera = Opera.new
    @operas = Opera.all.map {|opera| pp opera}
    @composers = Composer.all.sort_by{|x| x[:name]}.map {|x| [x[:name], x[:id]]}
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
    @composers = Composer.all.sort_by{|x| x[:name]}.map {|x| [x[:name], x[:id]]}
  end

  def update
    @opera = Opera.update(opera_params)
    if @opera.save
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
