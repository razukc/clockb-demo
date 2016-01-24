ActiveAdmin.register Slider do
config.batch_actions = false

index :download_links => false, as: :grid do |slider|
  dd link_to image_tag(slider.slide.thumb), edit_admin_slider_path(slider)
  dd link_to "Edit", edit_admin_slider_path(slider) 
  dd link_to "Delete", admin_slider_path(slider), method: :delete, data: { :confirm => "Are you sure?" }
end	

permit_params do
	permitted = [:slide, :caption, :remarks, :slide_cache]
end
config.filters = false
form do |f|
	f.inputs "Slider Settings" do
	li image_tag (f.object.slide.thumb.url) if f.object.slide?
		
	f.input :slide, as: :file
	f.input :slide_cache, as: :hidden
	f.input :caption, :placeholder => 'Caption text (Optional)'
	f.input :remarks, :label => 'Hide'#, :hint => 'Check to hide'
end
f.actions
end

end
