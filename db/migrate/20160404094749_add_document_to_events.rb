class AddDocumentToEvents < ActiveRecord::Migration
  def change
    add_column :events, :document, :string
  end
end
