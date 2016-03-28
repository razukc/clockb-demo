class Advert < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, AdvertUploader
	validates_presence_of :image
end
