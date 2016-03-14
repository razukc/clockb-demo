class BusinessRequirementsController < ApplicationController
	before_action :authenticate_user!
	#before_action :premium_only

	
	def index
		@business_requirements = current_user.business_requirements
	end

	def new
		@business_requirement = BusinessRequirement.new
		render partial: 'business_requirements/form'
	end

	def create
		@business_requirement = BusinessRequirement.create(business_requirement_params)
		respond_to do |format|
			format.html {redirect_to dashboard_path}
			format.js {}
		end
	end
	def premium_only
		unless current_user.premium?
			render partial: 'shared/upgrade_to_premium', locals: {_x: 'premium', _y: 'business_requirement', _z: current_user.id}
		end
	end
	
	private

	def business_requirement_params
		params.require(:business_requirement).permit(:content, :user_id, :created_at)
	end
end