ActiveAdmin.register Vacancy do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
permit_params content_ids: []

form do |f|
	f.inputs "Vacany Details" do
		f.fields_for :content do |r|
			r.input :job_title, :placeholder => 'Job Title'
			r.input :job_description, as: :text,:placeholder => 'Job Description'
		end
	end
	f.actions
end

end
