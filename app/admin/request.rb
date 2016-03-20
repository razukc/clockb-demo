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
		when 'meeting'
			pre "Request for " << xyz.request_for['_x'] << " / " << xyz.request_for['_y']
			dd "Name: "<<xyz.request_by['name']
			dd "Company: "<<xyz.request_by['company']
			dd "Phone: "<<xyz.request_by['phone']
			dd "Email: "<<xyz.request_by['email']
			
		
		when 'vacancy'
			pre "Application for Vacancy"
			dd link_to Vacancy.find_by_id(xyz.request_for['_z']).content['job_title'], admin_vacancy_path(xyz.request_for['_z'])
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
			dd link_to Event.find_by_id(xyz.request_for['_z']).form_params['name'], admin_event_path(xyz.request_for['_z'])
			dd "Name: "<<xyz.request_by['name']
			dd "Company: "<<xyz.request_by['company'] unless xyz.request_for['_y'] == 'weekly'
			dd "Phone: "<<xyz.request_by['phone']
			dd "Email: "<<xyz.request_by['email']

		when 'premium'
			pre "Request for Premium Package"
			dd link_to User.find_by_id(xyz.request_for['_z']).email, admin_user_path(xyz.request_for['_z'])
			
		end

	end


	column :created_at
	actions
end

end