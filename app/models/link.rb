class Link < ActiveRecord::Base
  validates :name, :url, presence: true

  scope :current, -> { where(show: true) }
end
