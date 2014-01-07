class WelcomeController < ApplicationController
  def home
    @bio = "Emily is nice." || About.last[:bio]
    @list = Composer.all.sort_by{|x| x[:name]}

  end  

  def calendar
    @performances = Performance.all
  end
  
end
