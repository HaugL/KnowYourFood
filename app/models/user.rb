class User < ActiveRecord::Base
  attr_accessible :email, :name, :admin

  has_many :comments, :dependent => :destroy
  has_many :admin_messages, :dependent => :destroy
           
  
  attr_accessor :password
  before_save :encrypt_password, :set_name
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email


   def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def set_name
    
  end
  
end
