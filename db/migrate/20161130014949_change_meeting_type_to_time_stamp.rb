class ChangeMeetingTypeToTimeStamp < ActiveRecord::Migration[5.0]
  def change
    change_column :meetings, :meeting_time, :timestamp
  end
end
