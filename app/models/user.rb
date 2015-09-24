class User < ActiveRecord::Base
  
  has_secure_password
  
  validates_presence_of :email, :password_digest, :username
  validates_uniqueness_of :email
end