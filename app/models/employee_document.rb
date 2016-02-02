class EmployeeDocument < ActiveRecord::Base
  belongs_to :user
  # serialize :attachment, Hash
  # serialize :files, Hash
  mount_uploader :attachment, DocumentUploader
  # mount_uploader :files, DocumentUploader
end
