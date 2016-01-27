# ActiveAdmin.register Member do
# index download_links: false do
# 	column :form_inputs
# 	column :email
# 	actions
# end
# form do |f|
# 	f.inputs "Member Details" do
# 		f.fields_for :form_inputs do |fi|
# 			fi.input :type, as: :select, 
# 				:collection => [["Client", "client"], ["Alumni", "alumni"],['Guest', 'guest']] 
# 		end
# 	end
# 	f.actions
# end
# config.filters = false
# permit_params :email
# action_item :invite, only: :edit do
#   link_to 'Invite',  send_invitation_admin_member_path, method: :post
# end

# member_action :send_invitation, :method => :post do
# 	@member = resource_class.invite!({email: resource.email})
# 	if @member.errors.empty?
# 		flash[:success] = "User has been successfully invited." 
# 		redirect_to edit_admin_member_path, method: :get
# 	else
# 		messages = @member.errors.full_messages.map { |msg| msg }.join
# 		flash[:error] = "Error: " + messages
# 		redirect_to edit_admin_member_path, method: :get
# 	end
# end
# end
