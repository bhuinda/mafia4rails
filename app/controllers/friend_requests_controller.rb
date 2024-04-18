class FriendRequestsController < ApplicationController
    before_action :authenticate_request
    before_action :set_friend_request, except: [:index, :create]

    # POST /friend_requests
    def create
        friend = User.find(params[:friend_id])
      
        if Friendship.exists?(user_id: @current_user.id, friend_id: friend.id)
          render json: { message: "Friendship already exists." }, status: :unprocessable_entity
        elsif FriendRequest.exists?(user_id: @current_user.id, friend_id: friend.id) || FriendRequest.exists?(user_id: friend.id, friend_id: @current_user.id)
          render json: { message: "Friend request already exists." }, status: :unprocessable_entity
        else
          @friend_request = @current_user.friend_requests.new(friend: friend)
      
          if @friend_request.save
            render json: { message: "Friend request was successfully created." }, status: :created
          else
            render json: { message: "Friend request failed." }, status: :unprocessable_entity
          end
        end
    end

    # GET /friend_requests
    def index
        @incoming = FriendRequest.where(friend: @current_user)
        @outgoing = @current_user.friend_requests
        render json: { incoming: @incoming, outgoing: @outgoing }, status: :ok
    end

    # PUT (ACCEPT) /friend_requests/:id/accept
    def update
        if @friend_request
            if @friend_request.accept
                render json: { message: "Friend request was successfully accepted." }, status: :ok
            else
                render json: { message: "Friend request failed to accept." }, status: :unprocessable_entity
            end
        else
            render json: { message: "Friend request not found." }, status: :not_found
        end
    end

    # DELETE (DECLINE) /friend_requests/:id/decline
    def destroy
        if @friend_request
            if @friend_request.destroy
                render json: { message: "Friend request was successfully declined." }, status: :ok
            else
                render json: { message: "Friend request failed to decline." }, status: :unprocessable_entity
            end
        else
            render json: { message: "Friend request not found." }, status: :not_found
        end
    end

    private

    def set_friend_request
        @friend_request = FriendRequest.find_by(user_id: params[:id], friend_id: @current_user.id)
    end
end
