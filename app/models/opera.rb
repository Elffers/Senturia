class Opera < ActiveRecord::Base
  attr_accessor :composer_name

  before_save :check_composer
  belongs_to :composer

  private
  def check_composer
    if self.composer_name
      c = Composer.create(name: composer_name)
      self.composer = c  
    end
  end

end
