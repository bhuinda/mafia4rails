class UserAchievementsController < ApplicationController
    before_action :authenticate_request, except: [:create]

    # GET /user_achievements
    def index
        @user_achievements = UserAchievement.all
        render json: @user_achievements
    end

    # GET /user_achievements/1
    def show
        @user_achievement = UserAchievement.find(params[:id])
        render json: @user_achievement
    end

    # POST /user_achievements
    def create
        @user_achievement = UserAchievement.new(user_achievement_params)
    
        if @user_achievement.save
          render json: @user_achievement, status: :created
        else
          render json: @user_achievement.errors, status: :unprocessable_entity
        end
    end
    
    private
    
    def user_achievement_params
        params.require(:user_achievement).permit(:user_id, :achievement_id)
    end
end
