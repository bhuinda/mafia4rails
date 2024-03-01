class UserInfo < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :achievements, through: :user_achievements
end
