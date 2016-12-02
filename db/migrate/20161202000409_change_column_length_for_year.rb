class ChangeColumnLengthForYear < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :year, :string, limit: 20
  end
end
