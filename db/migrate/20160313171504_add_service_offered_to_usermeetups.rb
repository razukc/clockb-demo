class AddServiceOfferedToUsermeetups < ActiveRecord::Migration
  def change
    add_column :usermeetups, :service_offered, :boolean, default: false
  end
end
