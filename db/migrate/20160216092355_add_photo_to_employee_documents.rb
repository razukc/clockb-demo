class AddPhotoToEmployeeDocuments < ActiveRecord::Migration
  def change
    add_column :employee_documents, :photo, :text
  end
end
