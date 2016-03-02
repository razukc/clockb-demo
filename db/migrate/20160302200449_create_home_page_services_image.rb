class CreateHomePageServicesImage < ActiveRecord::Migration
  def change
    create_table :home_page_services_images do |t|
      t.string :consulting
      t.string :outsourcing
      t.string :networking
      t.string :innovation
    end
  end
end
