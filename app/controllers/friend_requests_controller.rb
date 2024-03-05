class FriendRequestsController < ApplicationController
    before_action :authenticate_request
    before_action :set_friend_request, except: [:index, :create]

    # POST /friend_requests
    def create
        friend = User.find(params[:friend_id])
        @friend_request = @current_user.friend_requests.new(friend: friend)

        if @friend_request.save
            render json: {message: "Friend request was successfully created."}, status: :created
        else
            render json: @friend_request.errors, status: :unprocessable_entity
        end
    end

    # GET /friend_requests
    def index
        @incoming = FriendRequest.where(friend: @current_user)
        @outgoing = @current_user.friend_requests
        render json: {incoming: @incoming, outgoing: @outgoing}, status: :ok
    end

    # PATCH/PUT (ACCEPT) /friend_requests/1
    def update
        if @friend_request.accept
            render json: {message: "Friend request was successfully accepted."}, status: :ok
        else
            render json: @friend_request.errors, status: :unprocessable_entity
        end
    end

    # DELETE (DECLINE) /friend_requests/1
    def destroy
        if @friend_request.destroy
            render json: {message: "Friend request was successfully deleted."}, status: :ok
        else
            render json: @friend_request.errors, status: :unprocessable_entity
        end
    end

    private

    def set_friend_request
        @friend_request = FriendRequest.find(params[:id])
    end
end
