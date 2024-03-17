class AddNotesToWalks < ActiveRecord::Migration[7.0]
  def change
    add_column :walks, :notes, :string
  end
end
