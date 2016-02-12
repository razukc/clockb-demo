class UsermeetupsController < ApplicationController
def create
	@meetup = Usermeetup.new(usermeetups_params)
	@meetup.webinar = true if params[:webinar]
	@meetup.meetup = true if params[:meetup]
	@meetup.event = true if params[:event]
	@meetup.save!
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