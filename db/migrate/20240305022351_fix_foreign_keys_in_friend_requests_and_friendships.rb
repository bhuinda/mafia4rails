class FixForeignKeysInFriendRequestsAndFriendships < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :friend_requests, :friends
    remove_foreign_key :friendships, :friends

    add_foreign_key :friend_requests, :users, column: :user_id
    add_foreign_key :friend_requests, :users, column: :friend_id
    add_foreign_key :friendships, :users, column: :user_id
    add_foreign_key :friendships, :users, column: :friend_id
  end
end