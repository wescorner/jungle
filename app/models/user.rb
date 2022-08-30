class User < ApplicationRecord
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  validates_uniqueness_of :email

  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email.downcase.strip)
    if user.authenticate(password)
      user
    else
      nil
    end
  end

end
