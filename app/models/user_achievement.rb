class UserAchievement < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user_info
  belongs_to :achievement

  # VALIDATIONS
  validates :user_info, presence: true
  validates :achievement, presence: true

  # CALLBACKS
  after_create :update_user_info_points

  private

  # Add Achievement points to UserInfo points after creation
  def update_user_info_points
    user_info = self.user_info
    user_info.points += self.achievement.points
    user_info.save
  end
end

# TO-DO: Add extra semantic information, such as "times achieved," "progress," "completed," etc.