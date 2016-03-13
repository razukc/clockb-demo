class AddTimestampsToBusinessRequirements < ActiveRecord::Migration
  def change
  	change_table :business_requirements do |t|
  		t.timestamps null: false
  	end
  end
end
