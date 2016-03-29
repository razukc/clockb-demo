class AddAnimatedVideoFileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :animated_video_file, :string
  end
end
