class NextEventImage < ActiveRecord::Base
	mount_uploader :image, NextEventImageUploader
end