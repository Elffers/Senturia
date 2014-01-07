class Opera < ActiveRecord::Base
  attr_accessor :composer_name
  # validates :name, presence: true

  before_save :check_composer
  belongs_to :composer

  private
  def check_composer
    if self.composer_name != ''
      self.composer = Composer.create(name: composer_name)
    end
  end

end
