class Composer < ActiveRecord::Base
  has_many :operas
  validates :name, presence: true

  def self.alphabetize_array
    self.alphabetize.map {|composer| [composer[:name], composer[:id]]}
  end

  def self.alphabetize
    self.all.sort_by{ |composer| composer.name }
  end

  def sort_operas
    self.operas.sort_by{ |opera| opera.name }
  end

end
