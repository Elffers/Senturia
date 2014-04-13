class WelcomeController < ApplicationController
  def home
    # @links = Link.curent
    @links =  [ {
                  url: "http://www.houstongrandopera.org/studio",
                  name: "Houston Grand Opera Studio"
                },
                {
                  url: 'http://www.aspenmusicfestival.com/students-welcome/programs-of-study/aspen-opera-theater-center/',
                  name: "Aspen Opera Theater Center"
                },
                {
                  url:'http://www.wolftrap.org/Opera.aspx',
                  name: "Wolf Trap Opera Company"
                }
              ]
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
