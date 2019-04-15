class Api::V1::GoalsController < ApplicationController
  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      render json: {
        success: true, object: @goal, response_status: '200'
      }
    else
      render json: { success: false, response_status: '406' }
    end
  end

  private
  def workout_params
    params.require(:goal).permit(:goal_type, :measurable_achievement, :measurable_amount, :workout_date, :exercise_id)
  end
end
