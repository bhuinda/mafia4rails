class Friendship < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, presence: true, uniqueness: { scope: :friend }
  validates :friend, presence: true, uniqueness: { scope: :user }

  # CALLBACKS
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  private

  # Create a bidirectional friendship for ease of querying
  def create_inverse_relationship
    friend.friendships.create(friend: user)
  end

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end
end
