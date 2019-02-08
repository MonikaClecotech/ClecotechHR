class CreateAttendences < ActiveRecord::Migration[5.2]
  def change
    create_table :attendences do |t|
      t.integer :user_id
      t.datetime :in_time
      t.datetime :out_time

      t.timestamps
    end
  end
end
