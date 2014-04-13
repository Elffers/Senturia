class About < ActiveRecord::Base
  validates :bio, presence: true
  mount_uploader :resume, ResumeUploader
end
