class Request < ActiveRecord::Base
	mount_uploader :attachment, DocumentUploader
	serialize :request_by, Hash
end
