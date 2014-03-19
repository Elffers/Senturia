class WelcomeController < ApplicationController
  def home
    if About.last
      @bio =  About.last.bio
    else
      @bio = "Emily is the best"
    end
    @list = Composer.all.sort_by{|x| x[:name]}
  end

  def calendar
    @performances = Performance.all
  end
end
