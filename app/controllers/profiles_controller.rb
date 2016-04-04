# Networking Profiles
class ProfilesController < ApplicationController
before_action :authenticate_user!
before_action :premium_only, except: [:get_users, :show]

def get_users
	@industry_of_expertise = params[:networking_profile_name]
	@smth = NetworkingRequirement.select(:user_id)
		.where('content like ? and user_id not in (?)', @industry_of_expertise, current_user.id)
		.distinct
		@users_info = Array.new
		@smth.each do |smth|
			@users_info.push(:id => smth.user.id, :name => smth.user.inputs[:name])
		end

	render :json => {
                            :users_info => @users_info
                        }


end
def index
@profile_category = @k = params[:k]
@profiles = User.find_by_profile(@profile_category)
respond_to do |format|
	format.html {render partial: "profiles/index"}
	format.json {@profiles}
end

end

def show
	@user = User.public_profile(params[:id]).first
	@events = Event.all
end

def premium_only
unless current_user.premium?
render partial: 'shared/upgrade_to_premium',
locals: {_x: 'premium', _y: 'networking-profile', _z: current_user.id}
end
end
end