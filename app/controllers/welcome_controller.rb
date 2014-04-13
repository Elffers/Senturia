class WelcomeController < ApplicationController
  def home
    @links = Link.current

    if About.last
      @bio =  About.last.bio
    else
      @bio = "Emily is the best"
    end
    @composers = Composer.alphabetize
  end

  # def calendar
  #   @performances = Performance.all
  # end
end
