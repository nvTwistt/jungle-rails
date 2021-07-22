class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true

  def self.authentication(email, password)
  formatEmail = email.downcase
  user = User.find_by(email: formatEmail)
  user && user.authenticate(password)
  end
end