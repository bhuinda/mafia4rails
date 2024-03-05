class FriendRequest < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  
  # VALIDATIONS
  validate :not_self
  validates :user, presence: true, uniqueness: { scope: :friend }
  validates :friend, presence: true, uniqueness: { scope: :user }

  private

  # Create friendship, then destroy; see PATCH in controller
  def accept
    user.friends << friend
    destroy
  end

  # Check if user is trying to add themselves
  def not_self
    errors.add(:friend, "can't be the same as the user") if user == friend
  end
end
