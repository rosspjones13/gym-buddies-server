class CreateBuddies < ActiveRecord::Migration[5.2]
  def change
    create_table :buddies do |t|
      t.belongs_to :requester
      t.belongs_to :requestee
      t.string :buddy_type

      t.timestamps
    end
  end
end
