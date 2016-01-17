class AddAttachmentToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :attachment, :string
  end
end
