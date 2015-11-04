class Event < ActiveRecord::Base
	validates_presence_of :name, :message => 'Event name is required'
	def start_time
		self.start_date
	end
end
