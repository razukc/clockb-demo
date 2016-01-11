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
  	
  end
	
  private
end
