class BusinessRequirement < ActiveRecord::Base
	belongs_to :user
	before_create { |record| record.created_at = Time.now}
	validates_presence_of :content
end