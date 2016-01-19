class PagesController < ApplicationController
  layout 'pages'
	def index
		@events = Event.all
		@upcoming_events = Event.upcoming_home_page
		@sliders = Slider.where('remarks' => false)
	end
  
  def home
    @events = Event.all
    @upcoming_events = Event.upcoming_home_page
    @sliders = Slider.where('remarks' => false)
  end

  def services
  	
  end

  def careers
  	@vacancy = Vacancy.all
  end

  def events
    @events = Event.all
    @upcoming_events = Event.upcoming_home_page
  end

end
