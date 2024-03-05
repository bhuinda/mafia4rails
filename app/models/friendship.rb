class Friendship < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # VALIDATIONS
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

  # Destroy inverse upon self-destruction to avoid orphaned records
  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end
end

# TO-DO: Take advantage of bidirectionality by adding a "notes" feature, allowing each side of the friendship to customize their view of the other