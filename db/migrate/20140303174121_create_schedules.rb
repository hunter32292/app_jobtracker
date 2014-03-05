class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :userid
      t.string :start
      t.string :end
      t.string :day

      t.timestamps
    end
  end
end
