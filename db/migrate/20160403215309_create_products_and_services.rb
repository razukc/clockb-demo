class CreateProductsAndServices < ActiveRecord::Migration
  def change
    create_table :products_and_services do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
