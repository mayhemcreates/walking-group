class ChangeDateColumnTypeFromStringToDate < ActiveRecord::Migration[7.0]
  def change
    change_column :walks, :date, :date
  end
end
