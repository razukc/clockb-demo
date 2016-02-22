class Resourcex < ActiveRecord::Base
	serialize :meta, Hash
	mount_uploader :attach, DocumentUploader
	scope :by_category, -> category {where(category: category)}
	scope :by_add_to_site, -> {where(add_to_site: true)}
	scope :blogs, -> {where({:category => 'blog', :add_to_site => true})}
	scope :newsletters, -> {where({:category => 'newsletter', :add_to_site => true})}
	scope :videos, -> {where({:category => 'video', :add_to_site => true})}
end

