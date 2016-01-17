class Vacancy < ActiveRecord::Base
	serialize :content, Hash
end
