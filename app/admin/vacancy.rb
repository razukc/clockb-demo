ActiveAdmin.register Vacancy do
permit_params :content
config.filters = false
config.batch_actions = false
actions :all, except: [:show]
index :download_links => false do
	column :id
	column :content do |x|
			x.content['job_title']
	end
	column :created_at
	column :updated_at
	actions
end
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
