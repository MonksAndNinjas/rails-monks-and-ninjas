class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :objective
end
