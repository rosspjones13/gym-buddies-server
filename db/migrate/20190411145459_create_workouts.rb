class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :reps
      t.integer :measurable_amount
      t.date :workout_date
      t.belongs_to :exercise, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
