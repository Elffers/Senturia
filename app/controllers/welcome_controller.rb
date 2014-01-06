class WelcomeController < ApplicationController
  def home
    @bio = About.last[:bio]
    @list = Composer.all

  end  

  def calendar
    @performances = Performance.all
  end
  
end
