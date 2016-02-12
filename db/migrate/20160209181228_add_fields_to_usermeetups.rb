class AddFieldsToUsermeetups < ActiveRecord::Migration
  def change
    add_column :usermeetups, :meetup, :boolean
    add_column :usermeetups, :event, :boolean
  end
end
