class Composer < ActiveRecord::Base
  has_many :operas
  validates :name, presence: true

  def self.alphabetize_array
    self.alphabetize.map {|x| [x[:name], x[:id]]}
  end

  def self.alphabetize
    self.all.sort_by{ |x| x.name }
  end

end
