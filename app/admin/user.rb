ActiveAdmin.register User do
	

show title: :email do
columns do
	column do
		attributes_table do
			table do
				user.inputs.each do |k, v| 
					tr do	
						th do
							k
						end
						td do
							v.titleize
						end
					end
				end
			end
		end	
	end	
	column do	
		panel "Invitation" do
			attributes_table_for user do
				row :invitation_token
				row :invitation_sent_at
				row :invitation_accepted_at
			end
		end
		panel "Client Background" do
			attributes_table_for user do
				row :attachment
			end
		end
	end
end
end
index download_links: false do
	column "Category" do |k|
		k.inputs['type'].titleize
	end
	column :email
	column "Package" do |k|
		k.inputs['plan'].nil? ? "N/A" : k.inputs['plan'].titleize
	end
	column "Ownership" do |k|
		k.inputs['company'].nil? ? "N/A" : k.inputs['company'].titleize
	end
	column "Invitation" do  |k|		
		if k.invitation_created_at.nil?
			dd (link_to 'Invite', send_invitation_admin_user_path(k.id), method: :post)
			# dd (link_to 'Invite', user_invitation_path, method: :post)
		else
		 	if k.invitation_accepted_at.nil?
		 		dd "Sent" 
		 	else
		 		dd "Accepted"
			end
		end
	end
	actions
end
form do |f|
	f.semantic_errors *f.object.errors.keys
	if f.object.new_record? 
	f.inputs "Add new user" do
		f.input :email, :placeholder => 'user@domain.com'
		f.fields_for :inputs do |i|
			i.input :type, as: :radio, :include_blank => false,
				:collection => [
					["Alumni", "alumni",{ :checked => true } ],
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
	# f.actions
end
# config.filters = false
filter :inputs
permit_params :email
action_item :invite, only: :show do
  link_to 'Invite User',  send_invitation_admin_user_path, method: :post
  # link_to 'Invite User',  user_invitation_path, method: :post
end
actions :all#, except: [:show]
member_action :send_invitation, :method => :post do
	# @user = resource_class.invite!({email: resource.email})
	@user = User.find_by_id(params[:id])
	@user.invite!
	if @user.errors.empty?
		# @user.email = resource.inputs['email']
		# @user.save!
		flash[:success] = "User has been successfully invited." 
		redirect_to admin_users_path, method: :get
	else
		messages = @user.errors.full_messages.map { |msg| msg }.join
		flash[:error] = "Error: " + messages
		redirect_to admin_users_path, method: :get
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
		if @user.save && @user.errors.empty?
			redirect_to admin_user_path(@user)
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
