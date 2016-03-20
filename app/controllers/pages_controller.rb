class PagesController < ApplicationController
  layout 'pages'
  def rough
    @user = Event.all
  end
  def complete_profile
    @user = current_user
    if request.put?
      if @user.update(complete_profile_params)
        flash[:notice] = 'Profile was successfully updated'
      else
        flash[:notice] = 'Something went wrong. Please try again.'
      end
    end
    respond_to do |format|
      format.html { render 'complete_profile', :layout => 'application' }
    end
  end
  def test
    render "pages/test"
  end
  before_action :authenticate_user! , only: [:dashboard, :complete_profile]
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
    @business_requirement = BusinessRequirement.all.where('user_id not in (?)', current_user.id)
    @profiles = User.group_by_profiles
    @blogs = Resourcex.by_category('blog');
    format.html {render :layout => 'application'}
    #format.html {}
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
    @sliders = Slider.where('remarks' => false).order('updated_at DESC')
    @services_images = HomePageServicesImage.first
    @next_event = NextEventImage.first
    respond_to do |format|
      format.html {render :layout => 'application'}
    end
  end

  def services
  	respond_to do |format|
      format.html {}
    end
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
  private
  def complete_profile_params
    inputs_keys = params[:user][:inputs].keys
    inputs_keys.push(:interested_in => [])
    params.require(:user).permit(:interested_in, inputs: inputs_keys)
  end
end
