class User < ApplicationRecord
  has_many :subscriptions

  validates :name, presence: true
  validates :birthdate, presence: true
  validates :email, presence: true
  # validates @ and .com
  validates :email, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"], :name => auth_hash["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.birthdate = Time.now.strftime("%Y-%m-%d")
    end
  end

  def birth_year
    birthdate.to_time.strftime('%Y').to_i
  end

  def birth_info
   birthday = birthdate.to_time.strftime('%B %e %Y')
   age = Time.current.year - birth_year
   "Born on #{birthday} and is now #{age} years old"
  end
end
