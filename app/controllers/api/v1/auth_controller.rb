class Api::V1::AuthController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      #username is found AND password matches
      payload = {user_id: @user.id}
      token = encode(payload)
      render json: {
        message: "Authenticated!",
        authenticated: true,
        user: {
          user: @user,
          goals: @user.goals, 
          workouts: user_workouts,
          buddies: user_buddy_messages,
          exercises: Exercise.all
        },
        token: token
      }, status: :accepted
    else
      #username could not be found OR password is incorrect
      render json: {
        message: "Wrong username or password!",
        authenticated: false
      }, status: :not_acceptable
    end
  end

  private
  def user_buddy_messages
    @user.all_buddies.map do |buddy|
      {
        buddy: buddy, 
        requester: buddy.get_requester, 
        requestee: buddy.get_requestee, 
        messages: buddy.formatted_messages
      }
    end
  end

  def user_workouts
    @user.workouts.map do |workout|
      {workout: workout, exercise: workout.exercise_info}
    end
  end
end
