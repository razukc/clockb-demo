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
		when 'message_freelancer'
			pre 'Message to a Freelancer'
			@user = User.find_by_id(xyz.request_for['_z'])
			@freelancer = User.find_by_id(xyz.request_for['_a'])
			@message = xyz.request_by['comment']
			unless  @user.nil?
				dd link_to "From: " << @user.email, admin_user_path(xyz.request_for['_z'])
			end
			unless @freelancer.nil?
				dd link_to "Freelancer: " << @freelancer.email, admin_user_path(xyz.request_for['_a'])
			end
			dd "Message: " 
			pre "\"" << @message << "\""

		when 'book_webinar_appointment'
			pre 'Book Webinar appointment with Freelancer'
			@user = User.find_by_id(xyz.request_for['_z'])
			@freelancer = User.find_by_id(xyz.request_for['_a'])
			unless  @user.nil?
				dd link_to "From: " << @user.email, admin_user_path(xyz.request_for['_z'])
			end
			unless @freelancer.nil?
				dd link_to "Freelancer: " << @freelancer.email, admin_user_path(xyz.request_for['_a'])
			end
		when 'book_your_appointment'
			pre 'Book appointment with Freelancer'
			@user = User.find_by_id(xyz.request_for['_z'])
			@freelancer = User.find_by_id(xyz.request_for['_a'])
			unless  @user.nil?
				dd link_to "From: " << @user.email, admin_user_path(xyz.request_for['_z'])
			end
			unless @freelancer.nil?
				dd link_to "Freelancer: " << @freelancer.email, admin_user_path(xyz.request_for['_a'])
			end
		when 'join_as_clock_b_freelancer'
			pre 'Request for Join as a Clock b Freelancer'
			@user = User.find_by_id(xyz.request_for['_z'])
			unless @user.nil?
				dd link_to @user.email, admin_user_path(xyz.request_for['_z'])
			end
		when 'animated_video'
			pre "Request for Animated Video"
			@user = User.find_by_id(xyz.request_for['_z'])
			unless @user.nil?
				dd link_to @user.email, admin_user_path(xyz.request_for['_z'])
			end
						
		when 'meeting'
			pre "Request for " << xyz.request_for['_x'] << " / " << xyz.request_for['_y']
			dd "Name: "<<xyz.request_by['name']
			dd "Company: "<<xyz.request_by['company'].to_s
			dd "Phone: "<<xyz.request_by['phone'].to_s
			dd "Email: "<<xyz.request_by['email'].to_s

		
		when 'vacancy'
			pre "Application for Vacancy"
			@vacancy = Vacancy.find_by_id(xyz.request_for['_z'])
			unless @vacancy.nil?
				dd link_to @vacancy.content['job_title'], admin_vacancy_path(xyz.request_for['_z'])
			end
			dd "Name: "<<xyz.request_by['name'].to_s
			dd "Email: "<<xyz.request_by['email'].to_s
			dd "Comment: "<<xyz.request_by['comment'].to_s
			dd link_to "Download CV", xyz.attachment_url
		
		when 'internship'
			pre "Application for Internship"
			dd "Name: "<<xyz.request_by['name'].to_s
			dd "Email: "<<xyz.request_by['email'].to_s
			dd "Comment: "<<xyz.request_by['comment'].to_s
			dd link_to "Download CV", xyz.attachment_url

		when 'event'
			pre "Registration for Event"
			@event = Event.find_by_id(xyz.request_for['_z']) 
			unless @event.nil?
				dd link_to @event.form_params['name'], admin_event_path(xyz.request_for['_z'])
			end
			dd "Name: "<<xyz.request_by['name']
			dd "Company: "<<xyz.request_by['company'].to_s unless xyz.request_for['_y'] == 'weekly'
			dd "Phone: "<<xyz.request_by['phone'].to_s
			dd "Email: "<<xyz.request_by['email'].to_s
			if xyz.request_for['_y'] == 'main'
				dd "Field of expertise: "<<xyz.request_by['field_of_expertise'].to_s
				dd "Address: "<<xyz.request_by['address']
				dd "Attendee Category: "<<xyz.request_by['attendee_category'].humanize
				dd "Payment Option: "<<xyz.request_by['payment_options'].humanize
			end

		when 'premium'
			pre "Request for Premium Package"
			@user = User.find_by_id(xyz.request_for['_z'])
			unless @user.nil?
				dd link_to @user.email, admin_user_path(xyz.request_for['_z'])
			end
			
		end

	end


	column :created_at
	actions
end
end