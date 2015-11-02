class Alumni < ActiveRecord::Base
	mount_uploader :client_background, DocumentUploader

	validates_presence_of :name, :message => "Name is required"

	has_many :milestone_alumnis, :dependent => :destroy
	accepts_nested_attributes_for :milestone_alumnis, :allow_destroy => true,
	:reject_if => lambda { |a| a[:content].blank? }

	has_many :recommended_services, :dependent => :destroy
	accepts_nested_attributes_for :recommended_services, :allow_destroy => true,
	:reject_if => lambda { |a| a[:content].blank? }
end
