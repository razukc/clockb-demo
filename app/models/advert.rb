class Advert < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, SliderUploader
end
