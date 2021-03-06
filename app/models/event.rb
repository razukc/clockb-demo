class Event < ActiveRecord::Base
	has_many :event_sponsor_categories, dependent: :destroy
	accepts_nested_attributes_for :event_sponsor_categories, reject_if: :all_blank, allow_destroy: true
	has_many :event_discussion, dependent: :destroy
	accepts_nested_attributes_for :event_discussion, reject_if: :all_blank, allow_destroy: true
	has_many :main_event_sliders, dependent: :destroy
	accepts_nested_attributes_for :main_event_sliders,
		reject_if: :all_blank, allow_destroy: true
has_many :main_event_price_and_mileages, dependent: :destroy
	accepts_nested_attributes_for :main_event_price_and_mileages,
		reject_if: :all_blank, allow_destroy: true

	scope :main, -> {where("form_params like ?", '%type: main%')}
	scope :weekly, -> {where("form_params like ?", '%type: weekly%')}
	
	mount_uploader :attachment, EventUploader
	mount_uploader :document, DocumentUploader
	# serialize [:form_params, :link_params, :extra_params], Hash
	serialize :form_params, Hash
	serialize :link_params, Hash
	serialize :extra_params, Hash

	def self.attendees(id)
		
		Request.event.select{|c| c.request_for['_z'] == id.to_s }
	end
	def self.user_attendees(id)
		Usermeetup.where(:event => true, :user_x => id)
	end
	
	def self.m_all
		# Event.all.order(:start_date)
		Event.where('start_date >= ?', Date.today).order(:start_date)
	end
	def self.m_main
		m_all.select{|u| u.form_params['type'] == "main"}
	end
	def self.m_weekly
		m_all.select{|u| u.form_params['type'] == "weekly"}
	end
	def self.m_upcoming
		Event.where('start_date >= ?', Date.today).order(:start_date)
	end

	def self.m_upcoming_main
		 # Event.where('true = true', :form_params.find{|x| x[:type] == 'main'}).limit(1)
		# m_upcoming.find{ |u| u.form_params['type'] == "main" }
		m_upcoming.limit(3).select{ |u| u.form_params['type'] == "main" }
					
	end
	def self.m_upcoming_weekly
		# m_upcoming.find{ |u| u.form_params['type'] == "weekly"}
		m_upcoming.limit(3).select{ |u| u.form_params['type'] == "weekly"}
	end

	def self.m_slider
		Event.where('attachment not like ?', '').limit(5)
	end
	def self.m_gallery
		Event.where('attachment not like ?', '').limit(6)
	end
	def start_time
		self.start_date
	end
end
