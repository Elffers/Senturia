class Composer < ActiveRecord::Base
  has_many :operas
  validates :name, presence: true

  def self.alphabetize_array
    self.all.sort_by{|x| x[:name]}.map {|x| [x[:name], x[:id]]}
  end

end
