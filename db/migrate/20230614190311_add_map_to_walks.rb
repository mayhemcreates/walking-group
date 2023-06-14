class AddMapToWalks < ActiveRecord::Migration[7.0]
  def change
    add_column :walks, :map, :string
  end
end
