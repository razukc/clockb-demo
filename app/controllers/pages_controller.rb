class PagesController < ApplicationController
  layout 'pages'
	def index
		# @events = Event.all
		# @upcoming_events = Event.upcoming_home_page
		@sliders = Slider.where('remarks' => false)
	end
  
  def home
    @events = Event.all
    @upcoming_main = Event.upcoming_main
    @upcoming_weekly = Event.upcoming_weekly
    @sliders = Slider.where('remarks' => false)
  end

  def services
  	
  end

  def careers
  	@vacancy = Vacancy.all
  end

  def events
    @events = Event.all
    @slider = Event.slider
    @gallery = Event.gallery
    @upcoming_main = Event.upcoming_main
    @upcoming_weekly = Event.upcoming_weekly
  end
  def browse
    @events_single = Event.find_by_id(params[:id])
    @events_all = Event.all.order(:start_date)
  end
end
