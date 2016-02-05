class UsermeetupsController < ApplicationController
def create
	@meetup = Usermeetup.create(usermeetups_params)
	respond_to  do |format|
		format.html {redirect_to '/'}
		format.js {}
	end
end

private
def usermeetups_params
params.require(:usermeetup).permit(:user_x, :user_id, :webinar)
end
end