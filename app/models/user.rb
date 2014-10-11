class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  # Remember to create a migration!
end
