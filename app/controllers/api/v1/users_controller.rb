class Api::V1::UsersController < ApplicationController
  def index
    render json: all_user_names
  end

  def update
    User.find(params[:id]).update(user_params)
    render json: User.find(params[:id]).user_formatted
  end
  
  def profile
    @user = grab_user
    user_buddy_messages = @user.all_buddies.map do |buddy|
      {
        buddy: buddy, 
        requester: buddy.get_requester, 
        requestee: buddy.get_requestee, 
        messages: buddy.formatted_messages
      }
    end
    user_workouts = @user.workouts.map do |workout|
      {workout: workout, exercise: workout.exercise_info}
    end
    if @user
      render json: {
        user: @user.user_formatted, 
        # goals: @user.goals, 
        buddies: user_buddy_messages, 
        workouts: user_workouts,
        exercises: Exercise.all
      }
    end
  end

  def buddies
    @user = grab_user
    user_buddy_messages = @user.all_buddies.map do |buddy|
      {
        buddy: buddy, 
        requester: buddy.get_requester, 
        requestee: buddy.get_requestee, 
        messages: buddy.formatted_messages
      }
    end
    if @user
      render json: user_buddy_messages
    end
  end

  private
  def all_user_names
    User.all.map do |user|
      user.user_formatted
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :location, :status)
  end

  def grab_user
    token = request.headers["Authentication"].split(' ')[1]
    payload = decode(token)
    User.find(payload["user_id"])
  end
end
