class FriendRequest < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  
  # VALIDATIONS
  validate :not_self
  validates :user, presence: true, uniqueness: { scope: :friend }
  validates :friend, presence: true, uniqueness: { scope: :user }

  # Create friendship, then destroy; see UPDATE in controller
  def accept
    user.friends << friend
    destroy
  end

  private

  # Check if user is trying to add themselves
  def not_self
    errors.add(:friend, "can't be the same as the user") if user == friend
  end
end
