class AddPostcodeToWalks < ActiveRecord::Migration[7.0]
  def change
    add_column :walks, :postcode, :string
  end
end
