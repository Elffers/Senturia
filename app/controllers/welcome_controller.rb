class WelcomeController < ApplicationController
  def home
    @bio = About.last[:bio]
  end

  def calendar
    @performances = Performance.all
  end
  
end
