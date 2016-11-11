class ChangeMeetingTypeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :meetings, :meeting_type, :string
  end
end
