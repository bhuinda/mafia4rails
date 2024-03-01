class UserAchievement < ApplicationRecord
  # Associations
  belongs_to :user_info
  belongs_to :achievement

  # Add achievement points to UserInfo points after creation
  after_create :update_user_info_points

  private

  def update_user_info_points
    user_info = self.user_info
    user_info.points += self.achievement.points
    user_info.save
  end
end
