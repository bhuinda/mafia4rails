class UserInfoController < ApplicationController
    before_action :authenticate_request

    def index
        @info = @current_user.info
        render json: @info.as_json(include: :achievements), status: :ok
    end

    def show
        @info = User.find(params[:id]).info
        render json: @info.as_json(include: :achievements), status: :ok
    end
end
