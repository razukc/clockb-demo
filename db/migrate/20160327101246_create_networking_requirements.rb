class CreateNetworkingRequirements < ActiveRecord::Migration
  def change
    create_table :networking_requirements do |t|
      t.string :content
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
