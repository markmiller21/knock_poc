class AddYearToUsersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :year, :string, limit: 5
  end
end
