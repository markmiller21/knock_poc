class AddBioToUserstable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bio, :longtext
  end
end
