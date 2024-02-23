class User < ApplicationRecord
    has_secure_password
    has_one :user_info

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
end
