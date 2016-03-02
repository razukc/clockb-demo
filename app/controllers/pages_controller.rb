class PagesController < ApplicationController
  layout 'pages'
  
  def test
    render "pages/test"
  end
  before_action :authenticate_user! , only: [:dashboard]
  def dashboard
    @user = current_user
    
    respond_to do |format|
    if current_user.employee?
      @documents = @user.employee_documents
      format.html { render 'employee', :layout => 'application' }
    else
    @gallery = Event.m_gallery
    @upcoming_main = Event.m_upcoming_main
    @upcoming_weekly = Event.m_upcoming_weekly
    @adverts = Advert.all
    @profiles = User.group_by_profiles
    format.html {render :layout => 'application'}
    end

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
    @services_images = HomePageServicesImage.first
    respond_to do |format|
      format.html {render :layout => 'application'}
    end
  end

  def services
  	
  end

  def careers
  	@vacancy = Vacancy.all
  end
  def clockb
    @know_the_team = User.know_the_team
  end
  def events
    @events = Event.all
    @slider = EventsSlider.all.where(:add_to_site => true)
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
