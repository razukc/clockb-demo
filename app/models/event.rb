class Event < ActiveRecord::Base
	
	scope :main, -> {where("form_params like ?", '%type: main%')}
	scope :weekly, -> {where("form_params like ?", '%type: weekly%')}
	
	mount_uploader :attachment, EventUploader
	
	# serialize [:form_params, :link_params, :extra_params], Hash
	serialize :form_params, Hash
	serialize :link_params, Hash
	serialize :extra_params, Hash

	def self.attendees(id)
		Request.event.select{|c| c.request_for['_z'] == id.to_s }
	end
	def self.m_all
		Event.all.order(:start_date)
	end
	def self.m_main
		m_all.find{|u| u.form_params['type'] == "main"}
	end
	def self.m_weekly
		m_all.find{|u| u.form_params['type'] == "weekly"}
	end
	def self.m_upcoming
		Event.where('start_date >= ?', Date.today).order(:start_date)
	end

	def self.m_upcoming_main
		 # Event.where('true = true', :form_params.find{|x| x[:type] == 'main'}).limit(1)
		m_upcoming.find{ |u| u.form_params['type'] == "main" }
					
	end
	def self.m_upcoming_weekly
		m_upcoming.find{ |u| u.form_params['type'] == "weekly"}
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
