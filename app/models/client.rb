class Client < ActiveRecord::Base

	mount_uploader :client_background, DocumentUploader

	validates_presence_of :name, :message => "Name is required"

	has_many :services_catereds, :dependent => :destroy
	accepts_nested_attributes_for :services_catereds, :allow_destroy => true,
	:reject_if => lambda { |a| a[:content].blank? }
	
	has_many :program_schedules, :dependent => :destroy
	accepts_nested_attributes_for :program_schedules, :allow_destroy => true,
	:reject_if => lambda { |a| a[:content].blank? }
	
	has_many :milestones, :dependent => :destroy
	accepts_nested_attributes_for :milestones, :allow_destroy => true,
	:reject_if => lambda { |a| a[:content].blank? }
	
	has_many :feedbacks_of_the_services, :dependent => :destroy
	accepts_nested_attributes_for :feedbacks_of_the_services, :allow_destroy => true,
	:reject_if => lambda { |a| a[:content].blank? }
	
	has_many :schedule_for_meetings, :dependent => :destroy
	accepts_nested_attributes_for :schedule_for_meetings, :allow_destroy => true,
	:reject_if => lambda { |a| a[:content].blank? }
	
end
