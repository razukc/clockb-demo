# Networking Profiles
class ProfilesController < ApplicationController
before_action :authenticate_user!
before_action :premium_only, except: [:get_users]

def get_users
	@industry_of_expertise = params[:networking_profile_name]
	@smth = NetworkingRequirement.select(:user_id)
		.where('content like ?', @industry_of_expertise)
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
@profile = User.profile(params[:id])
render partial: "profiles/show"
end
def premium_only
unless current_user.premium?
render partial: 'shared/upgrade_to_premium',
locals: {_x: 'premium', _y: 'networking-profile', _z: current_user.id}
end
end
end