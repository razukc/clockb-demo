class EventSponsorCategory < ActiveRecord::Base
  belongs_to :event
  has_many :event_sponsor_logos, dependent: :destroy
  accepts_nested_attributes_for :event_sponsor_logos, reject_if: :all_blank, allow_destroy: true
end
