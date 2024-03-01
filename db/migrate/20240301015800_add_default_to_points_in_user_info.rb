class AddDefaultToPointsInUserInfo < ActiveRecord::Migration[7.1]
  def change
    change_column_default :user_infos, :points, 0
  end
end
