class FamilyMember < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :relationship, presence: true
  validates :relationship_status, presence: true

  def self.oldest_family_member
    order(:birthdate).first
  end
end
