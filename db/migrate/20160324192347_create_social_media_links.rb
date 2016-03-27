class CreateSocialMediaLinks < ActiveRecord::Migration
  def change
    create_table :social_media_links do |t|
      t.string :media
      t.string :link
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
