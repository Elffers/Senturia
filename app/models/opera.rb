class Opera < ActiveRecord::Base
  attr_accessor :composer_name
  
  belongs_to :composer
end
