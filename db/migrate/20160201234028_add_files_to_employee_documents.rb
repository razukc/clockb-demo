class AddFilesToEmployeeDocuments < ActiveRecord::Migration
  def change
    add_column :employee_documents, :files, :text, array: true
  end
end
