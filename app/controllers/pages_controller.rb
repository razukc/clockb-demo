class PagesController < ApplicationController
  layout 'pages'
  before_action :authenticate_user! , only: [:dashboard]
  def dashboard
    @user = current_user
    if current_user.employee?
      render 'employee'
    else
    @gallery = Event.m_gallery
    @upcoming_main = Event.m_upcoming_main
    @upcoming_weekly = Event.m_upcoming_weekly
    @adverts = Advert.all
    end
  end

	def index
		# @events = Event.all
		# @upcoming_events = Event.upcoming_home_page
		@sliders = Slider.where('remarks' => false)
	end
  
  def home
    @events = Event.all
    @upcoming_main = Event.m_upcoming_main
    @upcoming_weekly = Event.m_upcoming_weekly
    @sliders = Slider.where('remarks' => false)
  end

  def services
  	
  end

  def careers
  	@vacancy = Vacancy.all
  end

  def events
    @events = Event.all
    @slider = Event.m_slider
    @gallery = Event.m_gallery
    @upcoming_main = Event.m_upcoming_main
    @upcoming_weekly = Event.m_upcoming_weekly
    @v_main = Event.m_main
    @v_weekly = Event.m_weekly
  end
  def browse
    @events_single = Event.find_by_id(params[:id])
    @events_all = Event.all.order(:start_date)
  end
end
