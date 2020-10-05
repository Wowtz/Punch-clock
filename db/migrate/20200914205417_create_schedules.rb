class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :started_at
      t.datetime :finished_at

    end
  end
end
