class CreateWalks < ActiveRecord::Migration[7.0]
  def change
    create_table :walks do |t|
      t.string :location
      t.date :date
      t.string :leader

      t.timestamps
    end
  end
end
