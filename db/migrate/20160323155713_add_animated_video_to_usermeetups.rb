class AddAnimatedVideoToUsermeetups < ActiveRecord::Migration
  def change
    add_column :usermeetups, :animated_video, :boolean, default: false
  end
end
