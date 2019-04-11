class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end
  
  def profile
    @user = grab_user
    if @user
      render json: {user: @user, goals: @user.goals}
    end
  end

  def buddies
    @user = grab_user
    user_buddy_messages = @user.all_buddies.map do |buddy|
      {buddy: buddy, requester: buddy.get_requester, requestee: buddy.get_requestee, messages: buddy.formatted_messages}
    end
    if @user
      render json: user_buddy_messages
    end
  end

  private
  def grab_user
    token = request.headers["Authentication"].split(' ')[1]
    payload = decode(token)
    User.find(payload["user_id"])
  end
end
