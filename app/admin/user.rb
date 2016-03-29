ActiveAdmin.register User do
	sidebar :hint, only: :index do
		ul do
			li "Link 1: Invitation Sent"
			li "Link 2: Invitation Accepted"
			li "Link 3: Advert"
			li "Link 4: Feedback"
			li "Link 5: Regular"
			li "Link 6: Premium"
			li "Link 7: Company"
			li "Link 8: Individual"
			li "Link 9: Meetup"
			li "Link 10: Webinar"
			li "Link 11: Offered Services"
			li "Link 12: Posted Business Requirements"
		end
	end

	scope :all, default: true
	scope "Link 1", :invitation_sent
	scope "Link 2", :invitation_accepted
	scope "Link 3", :advertisers
	scope "Link 4", :feedbackers
	scope "Link 5", :regulars
	scope "Link 6", :premiums
	scope "Link 7", :companies
	scope "Link 8", :individuals
	scope "Link 9", :meetups
	scope "Link 10", :webinars
	scope "link 11", :offered_services
	scope "link 11", :offered_services
	scope "link 12", :posted_business_requirements
	scope "Events", :events

	show title: :email do
		columns	do
			column do
				attributes_table do
					table do
						user.inputs.each do |k, v| 
							tr do	
								th do
								k
								end
								td do
								v
								end
							end
						end
					end
				end

				panel "Info from Dashboard" do
					attributes_table_for user do
						row :website
						row :headline_message
						row :animated_video			
					end
				end	

				if user.employee_documents.any?
					panel "Employee Documents" do
						attributes_table_for user.employee_documents do
							row :name do |name|
								name.name.titleize
							end
							row :attachment do |att|
								link_to att.attachment.file.identifier, att.attachment.url if att.attachment?
							end
						end
					end
				end

				if user.attachment?
					panel "Client Background" do
						attributes_table_for user do
							row :attachment do |att|
								link_to att.attachment.file.identifier, att.attachment.url if att.attachment?
							end
						end
					end
				end

				if user.tasks.any?
					panel "Tasks" do
						attributes_table_for user do
							table do
								user.tasks.each do |k|
									tr do
										td do
										k['content']
										end
									end
								end
							end
						end
					end
				end

				if user.services_catereds.any?	
					panel (user.alumni? ? "Recommended Services" : "Services Catered") do
						attributes_table_for user do
							table do
								user.services_catereds.each do |k|
									tr do
										td do
											k['content']
										end
									end
								end
							end
						end
					end
				end

				if user.milestones.any?
					panel "Milestones" do
						attributes_table_for user do
							table do
								user.milestones.each do |k|
									tr do
										td do
											k['content']
										end
									end
								end
							end
						end
					end
				end

				columns do
					if user.program_schedules.any?	
						column do
							panel "Program Schedules" do
								attributes_table_for user do
									table do
									i = 1
										user.program_schedules.each do |k|
											tr do
												td do
													i
												end
												td do
													k['content']
												end
											end
										i = i + 1
										end
									end
								end
							end
						end
					end
					if user.schedule_for_meetings.any?
						column do
							panel "Schedules for meetings" do
								attributes_table_for user do
									table do
									i = 1
										user.schedule_for_meetings.each do |k|
											tr do
												td do
													i
												end
												td do
													k['content']
												end
											end
										i = i + 1
										end
									end
								end
							end
						end
					end
				end

			end
		
			column do
				panel "Invitation" do
					attributes_table_for user do
						row :status do |k|
							if k.invitation_created_at.nil?
								status_tag "never invited"
							else
							 	if !k.invitation_token.nil?
							 		status_tag 'awating response'
							 	else
							 		status_tag "accepted", :ok
								end
							end		
						end
					end
				end

				if user.adverts.any?
					user.adverts.map do |advert|
						panel advert.created_at do
							attributes_table_for advert do
								row :advert do
									image_tag advert.image_url(:thumb)
								end		
								row :info do
									simple_format advert.content
								end
							end
						end
					end
				end

				if user.meetups.any?
					user.meetups.map do |meetup|
						panel meetup.created_at do
							attributes_table_for meetup do
								if meetup.meetup?
									row :request_for_meetup_with do
										link_to User.find_by_id(meetup.user_x).email, admin_user_path(meetup.user_x)
									end
								end
								if meetup.webinar?
									row :request_for_webinar_with do
										link_to User.find_by_id(meetup.user_x).email, admin_user_path(meetup.user_x)	
									end
								end

								if meetup.event?
									row :registration_for_event do
										link_to Event.find_by_id(meetup.user_x).form_params['name'].titleize, admin_event_path(meetup.user_x)
									end
								end
								if meetup.service_offered?
									row :offered_service_for do
										text_node BusinessRequirement.find_by_id(meetup.user_x).content
									end
									row :requirement_posted_by do
										link_to User.find_by_id(BusinessRequirement.find_by_id(meetup.user_x).user_id).email, admin_user_path(User.find_by_id(BusinessRequirement.find_by_id(meetup.user_x).user_id).id)
									end
								end
							end
						end
					end
				end
				if user.business_requirements.any?
					user.business_requirements.map do |req|
						panel req.created_at do
							attributes_table_for req do
								row :posted_business_requirement do
									req.content.html_safe
								end
							end
						end
					end
				end
				if user.feedbacks.any?
					user.feedbacks.map do |feedback|
						panel feedback.created_at do
							attributes_table_for feedback do
								row :feedback
							end	
						end
					end
				end
			end
		end
	end

	index download_links: false do
		column :email
		column "_User" do |k|
			k.inputs['type'].titleize
		end
		actions
	end

	form :html => { :multipart => true } do |f|
		f.semantic_errors *f.object.errors.keys
		if f.object.new_record? 
			f.inputs "Add new user" do
				f.input :email, :placeholder => 'email@domain.com'
				f.fields_for :inputs do |i|
					i.input :type, as: :radio, :include_blank => false,
					:collection => [
					["Alumni", "alumni",{ :checked => true } ],
					["Client", "client"], 
					["Employee", "employee"],
					["Guest", "guest"],
					["Networker", "networker"],
					["Other", "other"]
					], 
					:label => "_User"
				end
			end
			f.actions
		else
			f.render f.object.inputs['type']
		end
	end

	filter :inputs_cont, label: "keyword"
	config.current_filters = false
	permit_params :email
	actions :all#, except: [:show]

	action_item :invite_user, only: :show do
		link_to 'Invite User',  send_invitation_admin_user_path, method: :post
		# link_to 'Invite User',  user_invitation_path, method: :post
	end

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
		after_destroy { |record|
			Usermeetup.where(:user_id => record.id).update_all(
				:service_offered => false, 
				:meetup => false, 
				:event => false, 
				:webinar => false)
		}
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
			:photo, :photo_cache, :remove_photo,
			:website, :headline_message, :animated_video,
			milestones_attributes: [:id, :content, :achieved, :_destroy],
			services_catereds_attributes: [:id, :content, :_destroy],
			program_schedules_attributes: [:id, :content, :_destroy],
			schedule_for_meetings_attributes: [:id, :content, :_destroy],
			tasks_attributes: [:id, :content, :status, :schedule, :_destroy],
			employee_documents_attributes: [:id, :name, :_destroy, :attachment, :attachment_cache],
			inputs: inputs_keys)
		end
	end

end
