ActiveAdmin.register Slider, as: "Home Page Slider" do
menu parent: "Sliders"
config.batch_actions = false


index as: :table, default: true, download_links: false

permit_params do
	permitted = [:slide, :caption, :remarks, :slide_cache]
end
config.filters = false
form do |f|
	columns do
		column span: 3 do
			f.inputs "Slider Settings" do
				f.input :slide, as: :file, label: "Image"
				f.input :slide_cache, as: :hidden
				f.input :caption, :placeholder => 'Caption text (Optional)', input_html: {rows: 4}
				f.input :remarks, :label => 'Hide'#, :hint => 'Check to hide'		
			end
		end
		column do
			if f.object.slide?
				f.inputs "Preview" do
					li image_tag (f.object.slide.thumb.url)		
				end
			end
		end
	end
f.actions
end

end
