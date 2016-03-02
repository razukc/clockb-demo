ActiveAdmin.register HomePageServicesImage do
config.batch_actions = false
config.filters = false
index download_links: false
menu parent: "Sliders"
permit_params :consulting, :outsourcing, :networking, :innovation,
	:consulting_cache, :outsourcing_cache, :networking_cache, :innovation_cache,
	:remove_consulting, :remove_outsourcing, :remove_networking, :remove_innovation

form :html => { :multipart => true } do |f|
	f.semantic_errors *f.object.errors.keys
	f.inputs "Upload Images" do
	if f.object.consulting && f.object.consulting.file
	  li label "Consulting", class: 'label' do
	  dd image_tag f.object.consulting.thumb.url
	  f.input :remove_consulting, as: :boolean, :label => "Remove"
	end
	else
	  f.input :consulting, as: :file, :label => "Consulting"
	  f.input :consulting_cache, as: :hidden
	end	

	if f.object.outsourcing && f.object.outsourcing.file
	  li label "Outsourcing", class: 'label'
	  dd image_tag f.object.outsourcing.thumb.url
	  f.input :remove_outsourcing, as: :boolean, :label => "Remove"
	else
	  f.input :outsourcing, as: :file, :label => "Outsourcing"
	  f.input :outsourcing_cache, as: :hidden
	end

	if f.object.networking && f.object.networking.file
	  li label "Networking", class: 'label'
	  dd image_tag f.object.networking.thumb.url
	  f.input :remove_networking, as: :boolean, :label => "Remove"
	else
	  f.input :networking, as: :file, :label => "Networking"
	  f.input :networking_cache, as: :hidden
	end

	if f.object.innovation && f.object.innovation.file
	  li label "Innovation", class: 'label'
	  dd image_tag f.object.innovation.thumb.url
	  f.input :remove_innovation, as: :boolean, :label => "Remove"
	else
	  f.input :innovation, as: :file, :label => "Innovation"
	  f.input :innovation_cache, as: :hidden
	end
	end
	f.actions
end
end
