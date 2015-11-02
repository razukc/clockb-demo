class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.text :content
      t.boolean :achieved
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
