class Achievement < ApplicationRecord
    # ASSOCIATIONS
    has_many :user_achievements
    has_many :user_infos, through: :user_achievements

    # VALIDATIONS
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
