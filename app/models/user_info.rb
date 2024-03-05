class UserInfo < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user
  has_many :user_achievements, dependent: :destroy
  has_many :achievements, through: :user_achievements

  # VALIDATIONS
  validates :user, presence: true
end
