class Event < ActiveRecord::Base
	has_and_belongs_to_many :members
	validates_presence_of :name, :message => 'Event name is required'
	def start_time
		self.start_date
	end
	def days_left
		num_days = 0
		num_days += (self.start_date - Date.today).to_i if (self.start_date - Date.today).to_i >= 0 
		num_days += (Date.today - self.start_date).to_i if (self.start_date - Date.today).to_i < 0 
		num_days
	end
	def self.status(resource)
		res = ""
		res << "Today" if (resource.start_date - Date.today).to_i == 0
		res << "Past" if (resource.start_date - Date.today).to_i < 0
		res << "Tomorrow" if (resource.start_date - Date.today).to_i == 1
		res << "Upcoming" if (resource.start_date - Date.today).to_i > 1
		res
	end
	def self.today
		Event.where('start_date = ?', Date.today).order(:start_date)
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
	def self.single_event_attendees_count(resource)
		resource.members.count
	end
end
