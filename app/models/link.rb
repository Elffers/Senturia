class Link < ActiveRecord::Base
  validates :name, :url, presence: true
end
