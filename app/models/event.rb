class Event < ActiveRecord::Base
	validates_presence_of :name
	def start_time
		self.start_date
	end
end
