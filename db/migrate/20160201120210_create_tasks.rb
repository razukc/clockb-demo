class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.boolean :status
      t.string :schedule
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
