class Member < ActiveRecord::Base
	validates_presence_of :email, :message => 'An email address is required'
  
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  enum package: [:basic, :pro]
  after_initialize :set_default_package, :if => :new_record?

  def set_default_package
    self.package ||= :basic
  end
end
