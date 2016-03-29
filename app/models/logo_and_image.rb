class LogoAndImage < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :content
  mount_uploader :content, LogoAndImageUploader
end
