class RequestsController < ApplicationController
def new
@request = Request.new
@_x = params[:_x] ? params[:_x] : '_x'
@_y = params[:_y] ? params[:_y] : '_y'
@_z = params[:_z] ? params[:_z] : '_z'
@_a = params[:_a] ? params[:_a] : '_a'
@_id = @_z ? @_z.to_i : 0
case @_x
when 'delete_animated_video'
	@_title = 'Delete Animated Video?'
		
when 'animated_video'
	@_title = 'Request for Animated Video'
		
when 'vacancy'
	@_title =  '_title'
	if @_id > 0
		@_title = 'Apply for the Vacancy'
		@job = Vacancy.find_by_id(@_id).content
		@job_title =  @job['job_title']
		@job_description = @job['job_description']
		@job_specification = @job['job_specification']
		@number_of_vacancies = @job['number_of_vacancies']
		@minimum_requirement = @job['minimum_requirement']
		
	end
when 'event'	
@_title = @_id > 0 ? Event.find_by_id(@_id).form_params['name'] : '_title'
when 'internship'
@_title = 'Apply as  Intern'
when 'meeting'
@_title = 'Request for Meeting'
when 'webinar'
@_title = 'Request for Webinar'
when 'premium'
@_title = "Request for Premium Package"
when 'meetup'
@_title = "Request for Meetup"
when 'webinar-meetup'
@_title = 'Request for Webinar'
else
@_title = '_title'
end
render partial: "requests/form"
end

def create
@request = Request.create(requests_params)
if @request.save
	case @request.link_params['_x']
		when 'meeting'
			ClockbMailer.meeting_email(@request.form_params['email']).deliver_now
		when 'vacancy'
			ClockbMailer.job_application_email(@request.form_params['email']).deliver_now
			ClockbMailer.admin_job_application_email(@request).deliver_now
		when 'webinar'
			ClockbMailer.webinar_email(@request.form_params['email']).deliver_now
		when 'event'
			ClockbMailer.event_email(@request.form_params['email'], Event.find_by_id(@request.link_params['_z']).form_params['type']).deliver_now
		when 'premium'
			ClockbMailer.premium_email(current_user.email).deliver_now
		when 'internship'
			ClockbMailer.admin_internship_email(@request).deliver_now
		when 'animated_video'
			@user = User.find_by_id(@request.link_params['_z'])
			@user.update(:animated_video => '[requested]')
			ClockbMailer.admin_animated_video_email(@user).deliver_now
			
		end
		
end
respond_to do |format|
# if @request.save
format.html {redirect_to '/'}
format.js {}
# format.json { render :json => @request, :status => :created, 
# location: @request}
# else
# format.js {}
# format.js { render :json => @request.errors, 
# :status => :unprocessable_entity}
# end	
end
end

private
def link_params
["_x", "_y", "_z", "_a"]
end
def form_params
["name", "company", "phone", "email",
"comment"]
end
def extra_params
["attachment_cache"]
end
def requests_params
# properties_keys = params[:request][:request_by].keys
# params.require(:request).permit(:request_for, :attachment, :attachment_cache,
params.require(:request).permit(:attachment, :attachment_cache, 
link_params: link_params, form_params: form_params)
# request_by: properties_keys)
end

def post_params
permit_key_params(params[:post]) do
params.require(:post)
end
end

def permit_key_params(hash)
permitted_params = yield
hash.keys.each do |key|
values = hash.delete(key)
permitted_params[key] = values if values
end
permitted_params
end
end
