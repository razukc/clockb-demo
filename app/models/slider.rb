class Slider < ActiveRecord::Base
	mount_uploader :slide, SliderUploader
end
