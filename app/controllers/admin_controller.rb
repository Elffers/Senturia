class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def home
    @about = About.last
  end

  def edit_bio
    if About.last
      @about = About.last
    else
      @about = About.new
    end
  end

  def update_bio
    @about = About.new(about_params)
    if @about.save
      redirect_to root_path
    else
      render :edit_bio
    end
  end

  def edit_resume
    @about = About.last
  end

  def update_resume
    @about = About.last
    if @about.update(about_params)
      redirect_to root_path
    else
      render :edit_resume
    end
  end

  private
  def performance_params
    params.require(:performance).permit(:date, :venue, :program)
  end

  def about_params
    params.require(:about).permit(:bio, :resume)
  end
end
