class UserInfo < ApplicationRecord
  # associations
  belongs_to :user
  has_many :achievements, through: :user_achievements
end
