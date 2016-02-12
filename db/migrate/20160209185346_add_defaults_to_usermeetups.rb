class AddDefaultsToUsermeetups < ActiveRecord::Migration
  def change
  	change_column :usermeetups, :meetup, :boolean, default: false
  	change_column :usermeetups, :event, :boolean, default: false
  end
end
