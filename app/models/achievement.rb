class Achievement < ApplicationRecord
    # Associations
    has_many :user_achievements
    has_many :user_infos, through: :user_achievements
end
