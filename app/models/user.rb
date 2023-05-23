class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    stripped_email = email.strip.downcase
    user = find_by("LOWER(email) = ?", stripped_email)
    user&.authenticate(password)
  end
end
