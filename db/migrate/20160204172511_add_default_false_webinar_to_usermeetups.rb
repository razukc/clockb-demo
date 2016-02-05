class AddDefaultFalseWebinarToUsermeetups < ActiveRecord::Migration
  def change
  	change_column :usermeetups, :webinar, :boolean, default: false
  end
end
