class User < ActiveRecord::Base
 mount_uploader :attachment, DocumentUploader

 devise :invitable, :database_authenticatable, :recoverable, :rememberable


 validates_presence_of :email, :message => " is required"
 validates_uniqueness_of :email, :message => " already in use"

  serialize :inputs, Hash
  # include DeviseInvitable::Inviter
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
