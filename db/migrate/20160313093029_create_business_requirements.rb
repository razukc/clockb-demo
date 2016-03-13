class CreateBusinessRequirements < ActiveRecord::Migration
  def change
    create_table :business_requirements do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
