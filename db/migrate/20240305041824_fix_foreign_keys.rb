class FixForeignKeys < ActiveRecord::Migration[7.1]
  def change
    # Remove duplicate foreign keys
    remove_foreign_key :friend_requests, :users
    remove_foreign_key :friendships, :users

    # Add foreign keys back correctly
    add_foreign_key :friend_requests, :users
    add_foreign_key :friend_requests, :users, column: :friend_id
    add_foreign_key :friendships, :users
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
