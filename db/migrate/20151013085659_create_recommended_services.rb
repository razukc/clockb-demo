class CreateRecommendedServices < ActiveRecord::Migration
  def change
    create_table :recommended_services do |t|
      t.text :content
      t.belongs_to :alumni, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
