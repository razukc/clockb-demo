class CreateServicesCatereds < ActiveRecord::Migration
  def change
    create_table :services_catereds do |t|
      t.text :content
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
