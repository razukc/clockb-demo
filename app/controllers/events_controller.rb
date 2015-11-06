class EventsController < ApplicationController
	# before_action :authenticate_member!, only: [:register]
	def register
	end

	def index
		@events = Event.all
	end
	
	def show
		@event = Event.find(params[:id])
	end
end
