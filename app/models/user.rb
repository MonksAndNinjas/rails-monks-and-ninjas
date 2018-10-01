class User < ApplicationRecord
  validates :name, presence: true
  validates :birthdate, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.birthdate = Time.now.strftime("%Y-%m-%d")
    end
  end
end
