class Event < ActiveRecord::Base
	has_and_belongs_to_many :members
	validates_presence_of :name, :message => 'Event name is required'
	def start_time
		self.start_date
	end
	def days_left
		(self.start_date - Date.today).to_i
	end
	def days_left2
		"Today" if (self.start_date - Date.today).to_i == 0
		(self.start_date - Date.today).to_i.to_s << "Days left" if (self.start_date - Date.today).to_i > 0
		"Completed" if (self.start_date - Date.today).to_i < 0
		"Tomorrow" if (self.start_date - Date.today).to_i == 1
	end
	def self.today
		Event.where(:start_date => Date.today).order(:start_date)
	end
	def self.upcoming
		Event.where('start_date >= ?', Date.today).order(:start_date)
	end
	def self.upcoming_home_page
		Event.where('start_date >= ?', Date.today).order(:start_date).limit(2)
	end
	def self.past
		Event.where('start_date < ?', Date.today).order(:start_date)
	end
end
