class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  private

  def accept
    user.friends << friend
    destroy
  end
end
