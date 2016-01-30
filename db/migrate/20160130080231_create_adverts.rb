class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.text :content
      t.string :image

      t.timestamps null: false
    end
  end
end
