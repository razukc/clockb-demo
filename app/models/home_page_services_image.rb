class HomePageServicesImage < ActiveRecord::Base
	mount_uploader :consulting, ServicesImageUploader
	mount_uploader :outsourcing, ServicesImageUploader
	mount_uploader :networking, ServicesImageUploader
	mount_uploader :innovation, ServicesImageUploader
end