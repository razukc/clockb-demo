class Event < ActiveRecord::Base
	mount_uploader :attachment, SliderUploader
	# serialize [:form_params, :link_params, :extra_params], Hash
	serialize :form_params, Hash
	serialize :link_params, Hash
	serialize :extra_params, Hash
	def self.upcoming
		Event.where('start_date >= ?', Date.today).order(:start_date)
	end

	def self.upcoming_main
		 # Event.where('true = true', :form_params.find{|x| x[:type] == 'main'}).limit(1)
		upcoming.find{ |u| u.form_params['type'] == "main" }
					
	end
	def self.upcoming_weekly
		upcoming.find{ |u| u.form_params['type'] == "weekly"}
	end

	def self.slider
		Event.where('attachment not like ?', '').limit(5)
	end
	def self.gallery
		Event.where('attachment not like ?', '').limit(6)
	end
	def start_time
		self.start_date
	end
end
