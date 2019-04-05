class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end
  
  def profile
    @user = grab_user
    if @user
      render json: @user
    end
  end

  def buddies
    @user = grab_user
    if @user
      render json: @user.all_buddies
    end
  end

  private
  def grab_user
    token = request.headers["Authentication"].split(' ')[1]
    payload = decode(token)
    User.find(payload["user_id"])
  end
end
