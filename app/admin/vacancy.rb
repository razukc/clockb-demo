ActiveAdmin.register Vacancy do
show title: "Vacancy" do
columns do
column do
panel "Vacancy Details" do
attributes_table_for vacancy do
	# row :content
row :job_title do
	vacancy['content']['job_title'].titleize
end
row :number_of_positions do
	vacancy['content']['number_of_vacancies']
end
row :job_description do
	simple_format vacancy['content']['job_description']
end
row :job_specification do
	simple_format vacancy['content']['job_specification']
end
row :applicants do
	Vacancy.applicants(vacancy.id).count
end
end
end
end
column do
		if Vacancy.applicants(vacancy.id).any?
			div do
				h4 "Applicants"
			end
		end
		Vacancy.applicants(vacancy.id).map do |post|
			panel post.created_at.to_s do
				attributes_table_for post do
					row :name do
						post.request_by['name']
					end
					row :email do
						post.request_by['email']
					end
					row :comment do
						simple_format post.request_by['comment']
					end
					row :document do
						link_to "Download CV", post.attachment.url		
					end
				end
			end
		end    
end
end
end
permit_params :content
config.filters = false
config.batch_actions = false
actions :all
index :download_links => false do
	# column :id
	# column :content
	

	column "Job Title" do |x|
			x.content['job_title']
	end
	
	column "Applicants" do |x|
		Vacancy.applicants(x.id).count
	end
	column "Posted on", :created_at
	actions
end
# index as: :block, download_links: false do |product|
#   div for: product do
#     # resource_selection_cell product
#     h3  link_to     product.content['job_title'], edit_admin_vacancy_path(product)
#     div "Created at: " << product.created_at.strftime('%e %b, %y')
#     # div truncate product.content['job_description']
#     br
#   end
# end
form  do |f|
	f.inputs "Vacancy Details" do
		f.fields_for :content, (OpenStruct.new(Vacancy.find_by_id(params[:id]).content) unless f.object.new_record?) do |r|
			r.input :job_title, :placeholder => 'Job Title'
			r.input :number_of_vacancies, :placeholder => 'Number of Vacancies'
			r.input :minimum_requirement, as: :text,:placeholder => 'Minimum requirement'
			r.input :job_description, as: :text,:placeholder => 'Job Description'
			r.input :job_specification, as: :text,:placeholder => 'Job Specification'
			r.input :application_deadline, as: :datepicker
		end
		# f.input :content
	end
	f.actions
end
controller do
	def update
		@vacancy = Vacancy.find_by_id(params[:id])
		if @vacancy.update(vacancy_params)
			redirect_to admin_vacancies_path
		else
			render 'edit'
		end

	end
	def edit
		@vacancy = Vacancy.find_by_id(params[:id])	
	end

	def create
		@vacancy = Vacancy.new(vacancy_params)
		if @vacancy.save
			redirect_to admin_vacancies_path
		else
			render 'new'
		end
	end

	def vacancy_params
		content_keys = params[:vacancy][:content].keys
		params.require(:vacancy).permit(content: content_keys)
	end

end
end
