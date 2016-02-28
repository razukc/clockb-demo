class UsermeetupsController < ApplicationController
def create
	@meetup = Usermeetup.new(usermeetups_params)
	@meetup.webinar = true if params[:webinar]
	@meetup.meetup = true if params[:meetup]
	@meetup.event = true if params[:event]
	
	if @meetup.save!
		if @meetup.meetup?
			ClockbMailer.meetup_email(current_user.email).deliver_now
		end
		if @meetup.webinar?
			ClockbMailer.webinar_email(current_user.email).deliver_now
		end
		if @meetup.event?
			@event_type = Event.find_by_id(@meetup.user_x).form_params["type"]
			ClockbMailer.event_email(current_user.email, @event_type).deliver_now
		end
	end
	respond_to  do |format|
		format.html {redirect_to '/'}
		format.js {}
	end
end

private
def usermeetups_params
params.require(:usermeetup).permit(:user_x, :user_id, :meetup, :webinar, :event)
end
end