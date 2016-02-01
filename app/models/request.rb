class Request < ActiveRecord::Base
	alias_attribute :form_params, :request_by
	alias_attribute :link_params, :request_for
	mount_uploader :attachment, DocumentUploader
	serialize :request_by, Hash
	serialize :request_for, Hash

	def self.meeting
		Request.all.select {|c| c.request_for['_x'] == 'meeting'}
	end
	def self.webinar
		Request.all.select {|c| c.request_for['_x'] == 'webinar'}
	end
	def self.vacancy
		Request.all.select {|c| c.request_for['_x'] == 'vacancy'}
	end
	def self.internship
		Request.all.select {|c| c.request_for['_x'] == 'internship'}
	end
	def self.event
		Request.all.select {|c| c.request_for['_x'] == 'event'}
	end
	def self.premium
		Request.all.select {|c| c.request_for['_x'] == 'premium'}
	end
end
