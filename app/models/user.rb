class User < ActiveRecord::Base
has_many :projects, dependent: :destroy
accepts_nested_attributes_for :projects, :reject_if => lambda { |record| record[:title].blank? }

has_many :users_websites, dependent: :destroy
accepts_nested_attributes_for :users_websites,
	:reject_if => lambda { |record| record[:address].blank? }
scope :invitation_accepted, -> {where("invitation_accepted_at is not null and invitation_token is null")}
scope :invitation_sent, -> {where("invitation_accepted_at is null and invitation_sent_at is not null")}
# this works too
# scope :invitation_accepted, -> { where("invitation_accepted_at is not null", invitation_token: nil)}
scope :premiums, -> {where("inputs like ?", '%plan: premium%')}
scope :regulars, -> {where("inputs like ?", '%plan: regular%')}
scope :companies, -> {where("inputs like ?", '%company: company%')}
scope :individuals, -> {where("inputs like ?", '%company: individual%')}
scope :advertisers, -> {joins(:adverts).distinct}
scope :feedbackers, -> {joins(:feedbacks).distinct}
scope :meetups, -> {joins(:meetups).where(:usermeetups => {meetup: true}).distinct}
scope :webinars, -> {joins(:meetups).where(:usermeetups => {webinar: true}).distinct}
scope :events, -> {joins(:meetups).where(:usermeetups => {event: true}).distinct}
scope :offered_services, -> {joins(:meetups).where(:usermeetups => {service_offered: true}).distinct}
scope :posted_business_requirements, -> {joins(:business_requirements).distinct}
scope :networkers, -> {where("inputs like ?", "%type: networker%")}

mount_uploader :attachment, DocumentUploader
mount_uploader :photo, PhotoUploader
mount_uploader :animated_video_file, AnimatedVideoUploader
devise :invitable, :database_authenticatable, :recoverable, :rememberable, :registerable, :validatable

# validates_length_of :headline_message, maximum: 150
validates_presence_of :email, :message => " is required"
validates_uniqueness_of :email, :message => " already in use"
# validates_format_of :website, :with => URI.regexp(['http', 'https'])
# validates :website, :url => true, allow_blank: true# Could be combined with `allow_blank: true`
serialize :inputs, Hash

# include DeviseInvitable::Inviter
has_many :meetups, :class_name => 'Usermeetup', :dependent => :destroy
has_many :feedbacks, :class_name => 'FeedbackFromUser', :dependent => :destroy

has_many :logo_and_images, :dependent => :destroy
accepts_nested_attributes_for :logo_and_images, allow_destroy: true,
	:reject_if => :all_blank

has_many :products_and_services, :dependent => :destroy
accepts_nested_attributes_for :products_and_services, allow_destroy:true,
	:reject_if => :all_blank

has_many :networking_requirements, dependent: :destroy
accepts_nested_attributes_for :networking_requirements, allow_destroy: true,
	:reject_if => :all_blank

has_many :social_media_links, :dependent => :destroy
accepts_nested_attributes_for :social_media_links, allow_destroy: true,
	:reject_if => :all_blank

has_many :adverts, :dependent => :destroy
accepts_nested_attributes_for :adverts,
	:reject_if => lambda { |record| record[:image].blank? }

has_many :business_requirements, :dependent => :destroy
accepts_nested_attributes_for :business_requirements,
	:reject_if => lambda { |record| record[:content].blank? || record[:content].empty?}

has_many :milestones, :dependent => :destroy
accepts_nested_attributes_for :milestones, :allow_destroy => true,
:reject_if => lambda { |a| a[:content].blank? }

has_many :schedule_for_meetings, :dependent => :destroy
accepts_nested_attributes_for :schedule_for_meetings, :allow_destroy => true,
:reject_if => lambda { |a| a[:content].blank? }

has_many :services_catereds, :dependent => :destroy
accepts_nested_attributes_for :services_catereds, :allow_destroy => true,
:reject_if => lambda { |a| a[:content].blank? }

has_many :program_schedules, :dependent => :destroy
accepts_nested_attributes_for :program_schedules, :allow_destroy => true,
:reject_if => lambda { |a| a[:content].blank? }

has_many :tasks, :dependent => :destroy
accepts_nested_attributes_for :tasks, :allow_destroy => true,
:reject_if => lambda { |a| a[:content].blank? }

has_many :employee_documents, :dependent => :destroy
accepts_nested_attributes_for :employee_documents, :allow_destroy => true,
:reject_if => lambda { |a| a[:attachment].blank? } #&& a[:files_cache].blank?

def to_s
	inputs['name']
end

def self.public_profile(id)
	User.where(id: id).limit(1)
end
def self.profile(id)
User.where(id: id).limit(1).pluck(:id, :inputs, :email)
# User.select("id, inputs, email").where("id = ?", id).limit(1)
end

def self.profiles
User.select("id, inputs, email").select{|h| h.inputs['type'].in? ['client','alumni','guest','networker'] }.sort
end

def self.group_by_profiles
# clients only
# User.all.select{|h| h.inputs['type'] == 'client' }
# User.all.select{|h| h.inputs['type'] == 'client' }.group_by{|h| h.inputs['profile']}

# clients, alumni, guest
# User.all.select{|h| h.inputs['type'].in? ['client','alumni','guest'] }
# User.all.select{|h| h.inputs['type'].in? ['client','alumni','guest'] }.group_by{|h| h.inputs['profile']}

# everyone in the table
# User.all.group_by{|h| h.inputs['profile']}

profiles.group_by{|h| h.inputs['profile']}
end

def self.find_by_profile(category)
category != "Uncategorized" ? category = category : category = ""
profiles.select{|h| h.inputs['profile'] == "#{category}"}

end

def self.networkers_except_current(user_id)
	condition = "type: networker"
	User.all.select{|x| x.inputs['type'] == 'networker' && x.id != user_id}
end

def self.view_regulars
User.all.select{|x| x.inputs['plan'] == 'regular'}
end
def self.view_premiums
User.all.select{|x| x.inputs['plan'] == 'premium'}
end
def self.view_companies
User.all.select{|x| x.inputs['company'] == 'company'}
end
def self.view_individuals
User.all.select{|x| x.inputs['company'] == 'individual'}
end
def self.know_the_team
	User.all.order("RANDOM()").select{|x| x.inputs['type'] == 'employee' && x.inputs['display_in_site'] == '1' }
end
def premium?
self.inputs['plan'] == 'premium'
end
def regular?
self.inputs['plan'] == 'regular'
end
def alumni?
self.inputs['type'] == 'alumni'
end
def client?
self.inputs['type'] == 'client'
end
def guest?
self.inputs['type'] == 'guest'
end
def employee?
self.inputs['type'] == 'employee'
end
def company?
self.inputs['company'] == 'company'
end
def other?
	self.inputs['type'] == 'other'
end
def networker?
	self.inputs['type'] == 'networker'
end
def plan
	self.inputs['plan'] ? self.inputs['plan'] : "regular"
end

def has_event(event_id, user_id)
	Usermeetup.find{|x| x.user_x == event_id && x.user_id == user_id}
end
def has_offered_service(business_requirement_id, user_id)
	Usermeetup.find{ |x| x.user_x == business_requirement_id && x.user_id == user_id}	
end
def has_requested_animated_video?
	self.animated_video == "[requested]"
end
def join_as_clock_b_freelancer?
	self.join_as_clock_b_freelancer == true
end
end
