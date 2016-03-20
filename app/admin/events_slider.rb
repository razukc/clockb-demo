ActiveAdmin.register EventsSlider do
	menu parent: "Sliders"
	config.batch_actions = false
config.filters = false
index download_links: false do
	column :image do |image|
		image_tag image.image_url(:thumb)
	end
	column :caption
	column :add_to_site
	actions
end
actions :all, except: [:show]
permit_params :image, :image_cache, :remove_image, :caption, :add_to_site, :created_at, :updated_at

form :html => { :multipart => true } do |f|
	f.semantic_errors *f.object.errors.keys
	f.inputs "Slider Details" do
	if f.object.image && f.object.image.file
	  li label "Event Slider", class: 'label' do
	  dd image_tag f.object.image_url(:thumb)
	  f.input :remove_image, as: :boolean, :label => "Remove"
	end
	else
	  f.input :image, as: :file, :label => "Event Slider"
	  f.input :image_cache, as: :hidden
	end	
	f.input :caption
	f.input :add_to_site
	end
	f.actions
end
controller do
	before_create  do |record|
		record.created_at = Time.now
		record.updated_at = record.created_at
	end
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
