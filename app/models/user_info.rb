class UserInfo < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  has_many :user_achievements, dependent: :destroy
  has_many :achievements, through: :user_achievements

  # VALIDATIONS
  validates :user, presence: true
  validates :points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
