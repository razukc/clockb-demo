ActiveAdmin.register Request do

config.filters = false
# config.per_page = 10
actions :all, except: [:new, :create, :edit, :update]

# index download_links: false do
# 	column :request_for do |r|
# 			span r.request_for['_x'].titleize if r.request_for['_x'] != '_x'
# 			span "/ " <<  r.request_for['_y'].titleize if r.request_for['_y'] != '_y'
# 			# span "/ " <<  r.request_for['_z'].titleize if r.request_for['_y'] != '_y'
# 		# li r.request_for['_y'] if r.request_for['_y'] != '_y'
# 	end
# 	column :request_by
# 	column :created_at
# 	actions
# end

index download_links: false do
	column :requests do |xyz|
		case xyz.request_for['_x']
		when 'delete_animated_video'
			pre "Confirm Animated Video Delete"
			if @user = User.find_by_id(xyz.request_for['_z'])
				dd link_to @user.email, admin_user_path(xyz.request_for['_z'])
			end
		when 'animated_video'
			pre "Request for Animated Video"
			if @user = User.find_by_id(xyz.request_for['_z'])
				dd link_to @user.email, admin_user_path(xyz.request_for['_z'])
			end
						
		when 'meeting'
			pre "Request for " << xyz.request_for['_x'] << " / " << xyz.request_for['_y']
			dd "Name: "<<xyz.request_by['name']
			dd "Company: "<<xyz.request_by['company']
			dd "Phone: "<<xyz.request_by['phone']
			dd "Email: "<<xyz.request_by['email']
			
		
		when 'vacancy'
			pre "Application for Vacancy"
			if @vacancy = Vacancy.find_by_id(xyz.request_for['_z'])
				dd link_to @vacancy.content['job_title'], admin_vacancy_path(xyz.request_for['_z'])
			end
			dd "Name: "<<xyz.request_by['name']
			dd "Email: "<<xyz.request_by['email']
			dd "Comment: "<<xyz.request_by['comment']
			dd link_to "Download CV", xyz.attachment_url
		
		when 'internship'
			pre "Application for Internship"
			dd "Name: "<<xyz.request_by['name']
			dd "Email: "<<xyz.request_by['email']
			dd "Comment: "<<xyz.request_by['comment']
			dd link_to "Download CV", xyz.attachment_url

		when 'event'
			pre "Registration for Event"
			if @event = Event.find_by_id(xyz.request_for['_z']) 
				dd link_to @event.form_params['name'], admin_event_path(xyz.request_for['_z'])
			end
			dd "Name: "<<xyz.request_by['name']
			dd "Company: "<<xyz.request_by['company'] unless xyz.request_for['_y'] == 'weekly'
			dd "Phone: "<<xyz.request_by['phone']
			dd "Email: "<<xyz.request_by['email']

		when 'premium'
			pre "Request for Premium Package"
			if @user = User.find_by_id(xyz.request_for['_z'])
				dd link_to @user.email, admin_user_path(xyz.request_for['_z'])
			end
			
		end

	end


	column :created_at
	actions
end
end