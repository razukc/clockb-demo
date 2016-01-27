ActiveAdmin.register User do
index download_links: false do
	column :inputs do |k|
		k.inputs['type'].titleize
	end

	column :email
	actions
end
form do |f|
	f.semantic_errors *f.object.errors.keys
	if f.object.new_record? 
	f.inputs "Add new user" do
		f.input :email, :placeholder => 'user@domain.com'
		f.fields_for :inputs do |i|
			i.input :type, as: :select, :include_blank => false,
				:collection => [
					["Alumni", "alumni"],
					["Client", "client"], 
					["Employee", "employee"],
					["Guest", "guest"]
				], :label => "Select one"
		end
	end	
	f.actions
	else
	 		f.render f.object.inputs['type']
	 end
	
end
# config.filters = false
filter :inputs
permit_params :email
action_item :invite, only: :show do
  link_to 'Invite User',  send_invitation_admin_user_path, method: :post
  # link_to 'Invite User',  user_invitation_path, method: :post
end

member_action :send_invitation, :method => :post do
	@user = resource_class.invite!({email: resource.email})
	if @user.errors.empty?
		# @user.email = resource.inputs['email']
		# @user.save!
		flash[:success] = "User has been successfully invited." 
		redirect_to admin_user_path, method: :get
	else
		messages = @user.errors.full_messages.map { |msg| msg }.join
		flash[:error] = "Error: " + messages
		redirect_to admin_user_path, method: :get
	end
end
  
controller do
	def update
		@user = User.find_by_id(params[:id])
		if @user.update(user_params)
			flash[:success] = "User has been successfully updated." 
			redirect_to admin_user_path(@user)
		else
			messages = @user.errors.full_messages.map { |msg| msg }.join
			flash[:error] = "Error: " + messages
			redirect_to edit_admin_user_path(@user)
		end
	end
	def edit
		@user = User.find_by_id(params[:id])
		# render @user.inputs['type'], layout: 'active_admin',
		# 	locals: { user: @user }	
	end
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to edit_admin_user_path(@user)
		else
			messages = @user.errors.full_messages.map { |msg| msg }.join
			flash[:error] = "Error: " + messages
			redirect_to new_admin_user_path(@user)
		end
	end
	def user_params
		inputs_keys = params[:user][:inputs].keys
		params.require(:user).permit(:email, 
			:attachment, :attachment_cache, :remove_attachment,
			inputs: inputs_keys)
	end
end
end
