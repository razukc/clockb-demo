class BusinessRequirement < ActiveRecord::Base
	belongs_to :user
	before_create { |record| record.created_at = Time.now}
	validates_presence_of :content
	after_destroy {|record|
		Usermeetup.where(:user_x => record.id).update_all(
			:service_offered => false
			)
	}
end