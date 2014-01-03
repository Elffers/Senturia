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

  private
  def performance_params
    params.require(:performance).permit(:date, :venue, :program)
  end

end
