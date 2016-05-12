class RequestsController < ApplicationController
def new
@request = Request.new
@_x = params[:_x] ? params[:_x] : '_x'
@_y = params[:_y] ? params[:_y] : '_y'
@_z = params[:_z] ? params[:_z] : '_z'
@_a = params[:_a] ? params[:_a] : '_a'
@_id = @_z ? @_z.to_i : 0
case @_x
when 'join_as_clock_b_freelancer'
	@_title = "Join as a Clock b Freelancer"

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
# @request = Request.create(requests_params)


# @request = Request.where("request_by like ? and request_for like ?" ,"%email: #{requests_params[:form_params][:email]}%", "%_x: #{requests_params[:link_params][:_x]}%").first_or_create(requests_params) do |obj|
# if requests_params[:link_params][:_x] == 'message_freelancer'

	@request = Request.where("request_for like ? and request_by like ? and created_at >= ?" ,"%_x: #{requests_params[:link_params][:_x]}%", "%email: #{requests_params[:form_params][:email]}%", 1.minute.ago).first_or_create(requests_params) do |obj|

# if @request.save
	# case @request.link_params['_x']
	case obj.link_params['_x']
		when 'message_freelancer'
			ClockbMailer.message_freelancer(obj).deliver_now
		when 'book_webinar_appointment'
			ClockbMailer.book_webinar_appointment(obj).deliver_now
		when 'book_your_appointment'
			ClockbMailer.book_your_appointment(obj).deliver_now
		when 'join_as_clock_b_freelancer'
			ClockbMailer.join_as_clock_b_freelancer(obj).deliver_now
		when 'meeting'
			ClockbMailer.meeting_email(obj.form_params['email']).deliver_now
		when 'vacancy'
			ClockbMailer.job_application_email(obj.form_params['email']).deliver_now
			ClockbMailer.admin_job_application_email(obj).deliver_now
		when 'webinar'
			ClockbMailer.webinar_email(obj.form_params['email']).deliver_now
		when 'event'
			ClockbMailer.event_email(obj.form_params['email'], Event.find_by_id(obj.link_params['_z']).form_params['type']).deliver_now
			ClockbMailer.admin_event_email_non_user(obj, Event.find_by_id(obj.link_params['_z']).form_params['type']).deliver_now
		when 'premium'
			ClockbMailer.premium_email(current_user.email).deliver_now
		when 'internship'
			ClockbMailer.admin_internship_email(obj).deliver_now
		when 'animated_video'
			@user = User.find_by_id(obj.link_params['_z'])
			@user.update(:animated_video => '[requested]')
			ClockbMailer.admin_animated_video_email(@user).deliver_now	
		end	
end
# end
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
["name", "company", "phone", "email", "field_of_expertise", "address",
"comment", "attendee_category", "payment_options"]
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
