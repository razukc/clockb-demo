class User < ActiveRecord::Base
 mount_uploader :attachment, DocumentUploader
 

 devise :invitable, :database_authenticatable, :recoverable, :rememberable


 validates_presence_of :email, :message => " is required"
 validates_uniqueness_of :email, :message => " already in use"

  serialize :inputs, Hash
  
  # include DeviseInvitable::Inviter

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
end
