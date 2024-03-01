class Achievement < ApplicationRecord
    # ASSOCIATIONS
    has_many :user_achievements
    has_many :user_infos, through: :user_achievements
end
