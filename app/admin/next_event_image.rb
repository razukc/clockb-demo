ActiveAdmin.register NextEventImage do
	config.filters = false
	config.batch_actions = false
	index download_links: false
	menu parent: "Sliders"
permit_params :image, :image_cache, :remove_image

form :html => { :multipart => true } do |f|
	f.semantic_errors *f.object.errors.keys
	f.inputs "Upload Image" do
	if f.object.image && f.object.image.file
	  li label "Next Event Image", class: 'label' do
	  dd image_tag f.object.image_url(:thumb)
	  f.input :remove_image, as: :boolean, :label => "Remove"
	end
	else
	  f.input :image, as: :file, :label => "Upload"
	  f.input :image_cache, as: :hidden
	end	
	end
end
end
