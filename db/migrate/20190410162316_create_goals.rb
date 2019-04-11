class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :goal_type
      t.integer :measurable_achievement
      t.datetime :achieve_date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
