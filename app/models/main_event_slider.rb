class MainEventSlider < ActiveRecord::Base
  belongs_to :event
  mount_uploader :image, MainEventSlidersUploader
end
