class Event < ActiveRecord::Base
	def start_time
		self.start_date
	end
end
