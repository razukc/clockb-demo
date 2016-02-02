class ChangeAttachmentToEmployeeDocuments < ActiveRecord::Migration
  def change
  	  	change_column :employee_documents, :attachment, :text
  end
end
