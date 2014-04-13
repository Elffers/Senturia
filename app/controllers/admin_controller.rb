class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

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
    @about = About.last
  end

  def update_bio
    @about = About.new(about_params)
    if @about.save
      redirect_to root_path
    else
      render :edit_bio
    end
  end

  private
  def performance_params
    params.require(:performance).permit(:date, :venue, :program)
  end

  def about_params
    params.require(:about).permit(:bio)
  end
end
