class UpdateForeignKeyForUsers < ActiveRecord::Migration[7.0]
    def change
      rename_column :walks, :users_id, :user_id
    end
end
