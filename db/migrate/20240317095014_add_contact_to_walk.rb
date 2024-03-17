class AddContactToWalk < ActiveRecord::Migration[7.0]
  def change
    add_column :walks, :contact, :string
  end
end
