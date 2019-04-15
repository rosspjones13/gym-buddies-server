class Api::V1::WorkoutsController < ApplicationController
  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      render json: {
        success: true, object: @workout, response_status: '200'
      }
    else
      render json: { success: false, response_status: '406' }
    end
  end

  private
  def workout_params
    params.require(:workout).permit(:user_id, :reps, :measurable_amount, :workout_date, :exercise_id)
  end
end
