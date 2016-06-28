class AddCommenterToEventDiscussions < ActiveRecord::Migration
  def change
    add_column :event_discussions, :commenter, :string
  end
end
