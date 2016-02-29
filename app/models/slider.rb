class Slider < ActiveRecord::Base
	mount_uploader :slide, HomePageSliderUploader
end
