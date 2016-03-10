# Networking Profiles
class ProfilesController < ApplicationController
before_action :authenticate_user!
before_action :premium_only
def index
@profile_category = @k = params[:k]
@profiles = User.find_by_profile(@profile_category)
render partial: "profiles/index"
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