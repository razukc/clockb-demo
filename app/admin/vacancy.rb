ActiveAdmin.register Vacancy do
permit_params :content
config.filters = false
config.batch_actions = false
actions :all, except: [:show]
index :download_links => false do
	# column :id
	# column :content
	column "Posted at", :created_at

	column "Job Title" do |x|
			x.content['job_title']
	end
	column "No." do |x|
			x.content['number_of_vacancies']
	end
	column "Min. requirement" do |x|
			 truncate x.content['minimum_requirement']
	end
	column "Job Desc" do |x|
			truncate x.content['job_description']
	end
	column "Job Spec" do |x|
			truncate x.content['job_specification']
	end
	# column "Applicants" do |x|
	# 	# Request.find_by(request_for: '{"_x"=>"vacancy","_y"=>"_y","_z"=>'<<x.id.to_s<<'}')
	# end
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
