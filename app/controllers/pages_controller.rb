class PagesController < ApplicationController
	def index
		@events = Event.all #to-do: add limit 2
	end
end
