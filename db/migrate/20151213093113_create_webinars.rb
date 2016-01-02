class CreateWebinars < ActiveRecord::Migration
  def change
    create_table :webinars do |t|
      t.string :name
      t.string :sessionId
      t.boolean :public

      t.timestamps null: false
    end
  end
end
