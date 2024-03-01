class User < ApplicationRecord
    # ASSOCIATIONS
    has_secure_password
    has_one :user_info

    # VALIDATIONS
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

    # CALLBACKS
    # Create UserInfo after User creation
    after_create :create_user_info

    private

    def create_user_info
        UserInfo.create(user: self, points: 0)
    end
end
