class ChangeWalkColumnDate < ActiveRecord::Migration[7.0]
  def change
    rename_column :walks, :date, :day
  end
end
