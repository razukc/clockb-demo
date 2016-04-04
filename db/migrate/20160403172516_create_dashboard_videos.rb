class CreateDashboardVideos < ActiveRecord::Migration
  def change
    create_table :dashboard_videos do |t|
      t.string :embed_code
      t.integer :number_of_videos

      t.timestamps null: false
    end
  end
end
