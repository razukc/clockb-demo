class PagesController < ApplicationController
	def index
		@events = Event.all
		@upcoming_events = Event.upcoming_home_page
		@sliders = Slider.where('remarks' => false)
	end
end
