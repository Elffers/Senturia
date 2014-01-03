class Performance < ActiveRecord::Base
  validates :date, presence: true
  validates :venue, presence: true
  validates :program, presence: true
  
end
