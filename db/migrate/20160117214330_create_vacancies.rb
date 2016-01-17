class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
