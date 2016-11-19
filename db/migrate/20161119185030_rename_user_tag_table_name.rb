class RenameUserTagTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :users_tags, :tags_users
  end
end
