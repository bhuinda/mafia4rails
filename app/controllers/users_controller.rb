class UsersController < ApplicationController
    before_action :authenticate_request, except: [:create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    # GET /users
    def index
      @users = User.all
      render json: @users
    end
  
    # GET /users/1
    def show
      @user = User.find(params[:id])
      render json: UserBlueprint.render(user, view: :normal), status: :ok
    end
  
    # GET /users/new
    def new
      @user = User.new
    end
  
    # GET /users/1/edit
    def edit
    end
  
    # POST /users
    def create
      @user = User.new(user_params)
  
      if @user.save
        render json: {message: "User was successfully created."}
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: {message: "User was successfully updated."}
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      if @user.destroy
        render json: {message: "User was successfully deleted."}
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    private
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
  end