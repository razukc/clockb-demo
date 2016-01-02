class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :slide
      t.text :caption
      t.boolean :remarks

      t.timestamps null: false
    end
  end
end
