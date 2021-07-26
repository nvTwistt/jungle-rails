class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, length: {minimum: 3}, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
  formatEmail = email.downcase
  user = User.find_by(email: formatEmail)
  user && user.authenticate(password)
  end
end