class CreateProgramSchedules < ActiveRecord::Migration
  def change
    create_table :program_schedules do |t|
      t.text :content
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
