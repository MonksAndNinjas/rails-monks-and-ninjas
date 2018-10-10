class User < ApplicationRecord
  has_many :family_members
  has_many :subscriptions
  has_many :priority_items
  has_many :inspirations
  has_many :disciplines
  has_many :quests
  has_many :objectives, through: :quests

  accepts_nested_attributes_for :family_members
  accepts_nested_attributes_for :subscriptions
  accepts_nested_attributes_for :priority_items
  accepts_nested_attributes_for :disciplines

  validates :name, presence: true
  validates :birthdate, presence: true
  validates :email, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, uniqueness: true
  validates :password, presence: true

  has_secure_password
  # maybe take advantage of using password confirmation for user editing and creating
  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"], :name => auth_hash["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.birthdate = Time.now.strftime("%Y-%m-%d")
    end
  end

  def birth_year
    birthdate.to_time.strftime('%Y').to_i
  end

  def birthday
    birthdate.to_time.strftime('%B %e %Y')
  end

  def age
    Time.current.year - birth_year
  end

  def birth_info
   "Born on #{birthday} and is now #{age} years old"
  end

  def display_name
    name.split.map(&:capitalize).join(' ')
  end
end
