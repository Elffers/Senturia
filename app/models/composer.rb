class Composer < ActiveRecord::Base
  has_many :operas
  validates :name, presence: true
end
