class ChangeMeetingTimeFromStringToDateTime < ActiveRecord::Migration[5.0]
  def change
    change_column :meetings, :meeting_time, :datetime
  end
end
