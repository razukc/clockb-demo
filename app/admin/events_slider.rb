ActiveAdmin.register EventsSlider do
	menu parent: "Sliders"
	config.batch_actions = false
config.filters = false
index download_links: false
permit_params :image, :caption, :add_to_site

form :html => { :multipart => true } do |f|
	f.semantic_errors *f.object.errors.keys
	f.inputs "Slider Details" do
	f.input :image, as: :file
	f.input :caption
	f.input :add_to_site
	end
	f.actions
end
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


end
