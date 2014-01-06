class AnalyticsController < ApplicationController
  http_basic_authenticate_with name: "Emilarr", password: "papillon1904"

  def home
  end

  def new_performance 
    @performance = Performance.new
  end

  def create_performance
    @performance = Performance.new(performance_params)
    if @performance.save
      redirect_to calendar_path
    else
      render :new_performance
    end
  end

  def edit_bio
    @about = About.new
  end

  def update_bio
    @about = About.new(about_params)
    if @about.save
      redirect_to root_path
    else
      render :edit_bio
    end
  end

  def add_rep
    @opera = Opera.new
    @composers = Composer.all.sort_by{|x| x[:name]}.map {|x| [x[:name], x[:id]]}
  end

  def update_rep
    @opera = Opera.new(opera_params)
    # if params[:composer_name]
    #   Composer.create(name: params[:composer_name])
    #   @opera.composer_id = Composer.find_by(name: params[:composer_name]).id
    # end
    if @opera.save
      redirect_to root_path
    else
      render :add_rep
    end

  end

  private
  def performance_params
    params.require(:performance).permit(:date, :venue, :program)
  end

  def about_params
    params.require(:about).permit(:bio)
  end

  def opera_params
    params.require(:opera).permit(:name, :composer_id, :composer_name)
  end
  

end
