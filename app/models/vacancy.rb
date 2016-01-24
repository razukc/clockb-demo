class Vacancy < ActiveRecord::Base
	def self.find_title_by_id(resource)
		Vacancy.find_by_id(resource).content['job_title']
	end
	serialize :content, Hash
end
