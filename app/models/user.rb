class User < ActiveRecord::Base

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

mount_uploader :attachment, DocumentUploader
mount_uploader :photo, PhotoUploader


devise :invitable, :database_authenticatable, :recoverable, :rememberable, :registerable


validates_presence_of :email, :message => " is required"
validates_uniqueness_of :email, :message => " already in use"

serialize :inputs, Hash

# include DeviseInvitable::Inviter
has_many :meetups, :class_name => 'Usermeetup', :dependent => :destroy
has_many :feedbacks, :class_name => 'FeedbackFromUser', :dependent => :destroy
has_many :adverts, :dependent => :destroy

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

def self.profile(id)
User.where(id: id).limit(1).pluck(:id, :inputs, :email)
# User.select("id, inputs, email").where("id = ?", id).limit(1)
end

def self.profiles
User.select("id, inputs, email").select{|h| h.inputs['type'].in? ['client','alumni','guest'] }.sort
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
	User.all.order(:created_at).select{|x| x.inputs['type'] == 'employee' && x.inputs['display_in_site'] == '1' }
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

end
