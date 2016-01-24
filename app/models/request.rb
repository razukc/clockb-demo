class Request < ActiveRecord::Base
	alias_attribute :form_params, :request_by
	alias_attribute :link_params, :request_for
	mount_uploader :attachment, DocumentUploader
	serialize :request_by, Hash
	serialize :request_for, Hash
end
