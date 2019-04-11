class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :category
      t.string :start_image
      t.string :end_image

      t.timestamps
    end
  end
end
