class ChangePhotoToEmployeeDocuments < ActiveRecord::Migration
  def change
  	change_column :employee_documents, :photo, :string
  end
end
