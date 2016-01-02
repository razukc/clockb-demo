class Member < ActiveRecord::Base
  def self.recent(n=5)
    Member.order(:created_at).limit(n)
  end
has_and_belongs_to_many :events
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  enum package: [:basic, :pro]
  # validates_presence_of :email, :password
  # validates_confirmation_of :password
  after_initialize :set_default_package, :if => :new_record?
  after_initialize :set_default_type, :if => :new_record?

  def set_default_type
  	self.company ||= false
  end

  def set_default_package
    self.package ||= :basic
  end
end
