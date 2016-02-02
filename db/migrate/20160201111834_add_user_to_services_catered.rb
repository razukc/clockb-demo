class AddUserToServicesCatered < ActiveRecord::Migration
  def change
    add_reference :services_catereds, :user, index: true, foreign_key: true
  end
end
