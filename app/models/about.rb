class About < ActiveRecord::Base
  validates :bio, presence: true
end
