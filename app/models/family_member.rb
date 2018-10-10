class FamilyMember < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :relationship, presence: true
  validates :relationship_status, presence: true
end
