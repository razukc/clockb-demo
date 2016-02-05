class AddWebinarToUsermeetups < ActiveRecord::Migration
  def change
    add_column :usermeetups, :webinar, :boolean
  end
end
