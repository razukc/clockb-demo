class AddAnimatedVideoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :animated_video, :string
  end
end
