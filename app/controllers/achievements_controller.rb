class AchievementsController < ApplicationController
    # GET /achievements
    def index
        @achievements = Achievement.all
        render json: @achievements
    end

    # GET /achievements/1
    def show
        @achievement = Achievement.find(params[:id])
        render json: @achievement
    end

    # GET /achievements/new
    def new
        @achievement = Achievement.new
    end

    # GET /achievements/1/edit
    def edit
    end

    # POST /achievements
    def create
        @achievement = Achievement.new(achievement_params)

        if @achievement.save
            render json: {message: "Achievement was successfully created."}, status: :created
        else
            render json: @achievement.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /achievements/1
    def update
    end

    # DELETE /achievements/1
    def destroy
        @achievement = Achievement.find(params[:id])

        if @achievement.destroy
            render json: {message: "Achievement was successfully deleted."}, status: :ok
        else
            render json: @achievement.errors, status: :unprocessable_entity
        end
    end

    private

    achievement_params = params.require(:achievement).permit(:name, :description, :points)
end
