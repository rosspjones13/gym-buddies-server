class Api::V1::BuddiesController < ApplicationController    
  # def messages
  #   @user = grab_user
  #   render json: @user.all_buddies.map{|bud| bud.get_requester}
  # end

  private
  def grab_user
    token = request.headers["Authentication"].split(' ')[1]
    payload = decode(token)
    User.find(payload["user_id"])
  end
end
