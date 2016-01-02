class EventsController < ApplicationController
	before_action :authenticate_member!, only: [:attend]
	def upcoming
		@events_upcoming = Event.upcoming
	end
	def attend
	  @event = Event.find(params[:id])
	  current_member.events << @event
	  flash['notice'] = "Thank you for signing up!"
	  redirect_to @event
	end

	def unattend
		@event = Event.find(params[:id])
		current_member.events.destroy(@event)
		flash['notice'] = "You have cancelled your attendance!"
		redirect_to @event
	end

	def index
		@events_all = Event.all
		@events_today = Event.today
		@events_upcoming = Event.upcoming
		@events_past = Event.past
	end
	
	def show
		@event = Event.find(params[:id])
	end
end
