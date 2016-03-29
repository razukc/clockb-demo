class BusinessRequirementsController < ApplicationController
	before_action :authenticate_user!
	after_destroy do |record|
		Usermeetup.where(:user_x => record.id).update_attributes(
			:service_offered => false
			)
	end	
	#before_action :premium_only
	respond_to :html, :js
	def get_user
	@user = User.find(params[:user_id])
	end
	def index
		@business_requirements = current_user.business_requirements
	end

	def new
		@business_requirement = BusinessRequirement.new
		render partial: 'business_requirements/form'
	end

	def create
		@user = get_user
		@business_requirement = @user.business_requirements.build(business_requirement_params)
		@business_requirement.save
		respond_to do |format|
			format.html {redirect_to dashboard_path}
			format.js {}
		end
	end

	def update
		@business_requirement = BusinessRequirement.find(params[:id])
		respond_to do |format|
		if @business_requirement.update_attributes(business_requirement_params)
			format.html
			format.json { respond_with_bip(@business_requirement)}
		end
		end
	end
	def destroy
		@business_requirement = BusinessRequirement.find(params[:id])
		respond_to do |format|
			if @business_requirement.destroy
				format.html
				format.js { }
			end
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