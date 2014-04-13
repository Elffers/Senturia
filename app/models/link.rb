class Link < ActiveRecord::Base
  validates :name, :url, presence: true

  # have a current method
end
