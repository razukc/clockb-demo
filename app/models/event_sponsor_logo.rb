class EventSponsorLogo < ActiveRecord::Base
  belongs_to :event_sponsor_category
  mount_uploader :logo, EventSponsorLogoUploader
end
