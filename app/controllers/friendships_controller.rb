class FriendshipsController < ApplicationController
  before_action :authenticate_request

  # POST /friendships
  def index
    @friends = @current_user.friends
    render json: @friends.as_json(only: [:username]), status: :ok
  end

  # DELETE /friendships/1
  def destroy
    @friendship = Friendship.find_by(user_id: @current_user.id, friend_id: params[:id])

    if @friendship.destroy
      render json: {message: "Friendship was successfully deleted."}, status: :ok
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end
end
