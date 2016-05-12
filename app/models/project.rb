class Project < ActiveRecord::Base
  belongs_to :user
  mount_uploader :document, ProjectDocumentUploader
  validates_presence_of :title
end
