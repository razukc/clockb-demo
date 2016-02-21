class EmployeeDocument < ActiveRecord::Base
  belongs_to :user
  # serialize :attachment, Hash
  # serialize :files, Hash
  mount_uploader :attachment, AioUploader
  def self.photo
  	EmployeeDocument.select("id, attachment").where("name like ?", 'employee-photo')
  end
end
