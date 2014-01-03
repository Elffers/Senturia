class WelcomeController < ApplicationController
  def home
  end

  def calendar
    @performances = Performance.all
  end
  
  def analytics
  end
end
