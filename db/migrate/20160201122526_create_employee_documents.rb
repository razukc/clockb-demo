class CreateEmployeeDocuments < ActiveRecord::Migration
  def change
    create_table :employee_documents do |t|
      t.string :name
      t.string :attachment
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
