class ChangeDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :rankings, :time, :integer, :default => 0, using: 'time::integer'
  end
end
