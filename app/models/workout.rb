class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  def exercise_info
    self.exercise
  end
end
