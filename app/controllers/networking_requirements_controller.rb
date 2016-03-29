class NetworkingRequirementsController < ApplicationController
	before_action :authenticate_user!
	# before_action :premium_only
	def create
		@user = User.find(params[:user_id])
		@networking_requirement = @user.networking_requirements.build(networking_requirement_params)
		@networking_requirement.save
		respond_to do |format|
			format.html {redirect_to dashboard_path}
			format.js {}
		end
	end

	def update
		@networking_requirement = NetworkingRequirement.find(params[:id])
		respond_to do |format|
		if @networking_requirement.update_attributes(networking_requirement_params)
			format.html
			format.json { respond_with_bip(@networking_requirement)}
		end
		end
	end
	def destroy
		@networking_requirement = NetworkingRequirement.find(params[:id])
		respond_to do |format|
			if @networking_requirement.destroy
				format.html
				format.js { }
			end
		end
	end
	def premium_only
		unless current_user.premium?
			render partial: 'shared/upgrade_to_premium', locals: {_x: 'premium', _y: 'networking_requirement', _z: current_user.id}
		end
	end
	
	private

	def networking_requirement_params
		params.require(:networking_requirement).permit(:content, :user_id)
	end
end