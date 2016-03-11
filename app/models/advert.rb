class Advert < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, AdvertUploader
end
