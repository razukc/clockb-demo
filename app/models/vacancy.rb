class Vacancy < ActiveRecord::Base
	def self.applicants(id)
		# vacancy.select{|c| c.request_for['_z'] == id}
		Request.vacancy.select{|c| c.request_for['_z'] == id.to_s}
		
	end
	def self.find_title_by_id(resource)
		Vacancy.find_by_id(resource).content['job_title']
	end
	serialize :content, Hash
	def self.current_vacancies
		Vacancy.all.select {|x| x.content['application_deadline'].to_date >= Date.today()}
	end
end
