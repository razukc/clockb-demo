class CreateMilestoneAlumnis < ActiveRecord::Migration
  def change
    create_table :milestone_alumnis do |t|
      t.text :content
      t.boolean :achieved
      t.belongs_to :alumni, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
