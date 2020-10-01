class CreateDayoffs < ActiveRecord::Migration[6.0]
  def change
    create_table :dayoffs do |t|
      t.date :vacantday
    end
  end
end
