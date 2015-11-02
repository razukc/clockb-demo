class CreateFeedbacksOfTheServices < ActiveRecord::Migration
  def change
    create_table :feedbacks_of_the_services do |t|
      t.text :content
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
