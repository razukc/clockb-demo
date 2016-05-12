class AddClockBFreelancerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :clock_b_freelancer, :boolean, default: false
  end
end
