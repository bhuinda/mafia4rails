class User < ApplicationRecord
    # ASSOCIATIONS
    has_secure_password

    has_one :user_info, dependent: :destroy

    has_many :friend_requests, dependent: :destroy
    has_many :pending_friends, through: :friend_requests, source: :friend
    
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships

    # VALIDATIONS
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

    # CALLBACKS
    # Create UserInfo after User creation
    after_create :create_user_info

    private

    def create_user_info
        UserInfo.create(user: self)
    end
end
