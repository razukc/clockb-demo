class AddHeadlineMessageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :headline_message, :text
  end
end
