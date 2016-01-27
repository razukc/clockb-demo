class User < ActiveRecord::Base
	
 serialize :inputs, Hash
 validates_presence_of :email, :message => "Email is required"
 mount_uploader :attachment, DocumentUploader
  devise :invitable, :database_authenticatable, :recoverable, :rememberable
  # include DeviseInvitable::Inviter
  def premium?
  	self.inputs['plan'] == 'premium'
  end
  def regular?
  	self.plan['regular'] == 'regular'
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
