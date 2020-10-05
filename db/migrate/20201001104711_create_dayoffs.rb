class CreateDayoffs < ActiveRecord::Migration[6.0]
  def change
    create_table :dayoffs do |t|
      t.date :vacantday
      t.string :description
      
    end
  end
end
