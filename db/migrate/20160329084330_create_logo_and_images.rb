class CreateLogoAndImages < ActiveRecord::Migration
  def change
    create_table :logo_and_images do |t|
      t.string :content
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
